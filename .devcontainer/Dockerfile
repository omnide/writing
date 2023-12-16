ARG VARIANT=bullseye
FROM mcr.microsoft.com/vscode/devcontainers/python:3.11-${VARIANT}

ARG HOME=/home/vscode
ARG UID=1000
ARG GID=${UID}

RUN install -d -m 0755 -o vscode -g ${GID} ${HOME}/.config
COPY --chmod=0755 --chown=${UID}:${GID} config/starship.toml ${HOME}/.config/starship.toml

# Clobbered by devcontainer features, so moved to a local 'final-layers' feature
# RUN echo 'eval "$(starship init zsh)"' >> ${HOME}/.zshrc

COPY --chmod=0755 --chown=${UID}:${GID} scripts/* /tmp/install/
RUN sudo -u vscode /tmp/install/add-vale-styles.sh

ENV PATH=${HOME}/.local/bin:${PATH}

