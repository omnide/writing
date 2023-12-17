---
title: Cards
glightbox: false
---

# :material-view-grid-outline: Cards

Read more about the cards plugin in the
[documentation from neoteroi](https://www.neoteroi.dev/mkdocs-plugins/cards/).

[cards(./docs/examples/cards/net-cards.yaml)]

## Configuration

The cards above use a separate yaml file. Note the path relative to the parent directory of the
`mkdocs.yml` file.

```text
[cards(./docs/examples/cards/net-cards.yaml)]
```

The definitions themselves from `net-cards.yaml` are:

<!-- prettier-ignore-start -->
``` yaml
{% include 'examples/cards/net-cards.yaml' %}
```
<!-- prettier-ignore-end -->
