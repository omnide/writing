---
title: Devcontainer
---

# :material-microsoft-visual-studio-code: Devcontainer

## Dockerfile

The base Dockerfile provides some foundations for installing additional tools and features. It
primarily copies in a few static configuration files and scripts to be used downstream during
feature layering and within the devcontainer integrated shell.

<!-- prettier-ignore-start -->
```dockerfile
{% include 'includes/Dockerfile' %}
```
<!-- prettier-ignore-end -->
