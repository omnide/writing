#!/usr/bin/env bash
set -e

# Clean up
rm -rf /var/lib/apt/lists/*

STRUCTURIZR_VERSION="${VERSION:-"latest"}"

architecture="$(uname -m)"
case ${architecture} in
    x86_64) architecture="amd64";;
    aarch64 | armv8*) architecture="arm64";;
    aarch32 | armv7* | armvhf*) architecture="arm";;
    i?86) architecture="386";;
    *) echo "(!) Architecture ${architecture} unsupported"; exit 1 ;;
esac

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

# Figure out correct version of a three part version number is not passed
find_version_from_git_tags() {
    local variable_name=$1
    local requested_version=${!variable_name}
    if [ "${requested_version}" = "none" ]; then return; fi
    local repository=$2
    local prefix=${3:-"tags/v"}
    local separator=${4:-"."}
    local last_part_optional=${5:-"false"}    
    if [ "$(echo "${requested_version}" | grep -o "." | wc -l)" != "2" ]; then
        local escaped_separator=${separator//./\\.}
        local last_part
        if [ "${last_part_optional}" = "true" ]; then
            last_part="(${escaped_separator}[0-9]+)?"
        else
            last_part="${escaped_separator}[0-9]+"
        fi
        local regex="${prefix}\\K[0-9]+${escaped_separator}[0-9]+${last_part}$"
        local version_list="$(git ls-remote --tags ${repository} | grep -oP "${regex}" | tr -d ' ' | tr "${separator}" "." | sort -rV)"
        if [ "${requested_version}" = "latest" ] || [ "${requested_version}" = "current" ] || [ "${requested_version}" = "lts" ]; then
            declare -g ${variable_name}="$(echo "${version_list}" | head -n 1)"
        else
            set +e
            declare -g ${variable_name}="$(echo "${version_list}" | grep -E -m 1 "^${requested_version//./\\.}([\\.\\s]|$)")"
            set -e
        fi
    fi
    if [ -z "${!variable_name}" ] || ! echo "${version_list}" | grep "^${!variable_name//./\\.}$" > /dev/null 2>&1; then
        echo -e "Invalid ${variable_name} value: ${requested_version}\nValid values:\n${version_list}" >&2
        exit 1
    fi
    echo "${variable_name}=${!variable_name}"
}

apt_get_update()
{
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}

# Checks if packages are installed and installs them if not
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        apt_get_update
        apt-get -y install --no-install-recommends "$@"
    fi
}

# Ensure apt is in non-interactive to avoid prompts
export DEBIAN_FRONTEND=noninteractive

# Install dependencies if missing
# Note that libxtst6 is required to run the structurizr-cli export to puml
check_packages curl ca-certificates gnupg2 dirmngr coreutils unzip dnsutils libxtst6
if ! type git > /dev/null 2>&1; then
    check_packages git
fi

mkdir -p /tmp/downloads
cd /tmp/downloads

# Install structurizr-cli
find_version_from_git_tags STRUCTURIZR_VERSION 'https://github.com/structurizr/cli'
zip_file="structurizr-cli-${STRUCTURIZR_VERSION}.zip"
echo "(*) Downloading Terraform docs... ${zip_file}"
curl -sSL -o /tmp/downloads/${zip_file} https://github.com/structurizr/cli/releases/download/v${STRUCTURIZR_VERSION}/${zip_file}
mkdir -p /tmp/downloads/structurizr-cli
unzip "${zip_file}" -d /tmp/downloads/structurizr-cli
ls -la /tmp/downloads/structurizr-cli
mv /tmp/downloads/structurizr-cli /usr/local/bin/structurizr-cli
ln -s /usr/local/bin/structurizr-cli/structurizr.sh /usr/local/bin/structurizr

rm -rf /tmp/downloads

# Clean up
rm -rf /var/lib/apt/lists/*

echo "Done!"


