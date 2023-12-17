---
title: MkDocs
---

# :simple-materialformkdocs: MkDocs

Configuration for this mkdocs site is described below.

## requirements.txt

The `requirements.txt` file lists the various python packages available from
[PyPI](https://pypi.org/) that are used to build the site.

```text
{% include 'includes/requirements.txt' %}
```

## mkdocs.yml

The `mkdocs.yml` configuration includes basic site metadata, and settings to control plugin
behaviors and styles. The raw include that shows the configuration file is shown first. This uses
`mkdocs-macros-plugin` to embed content from separate files.

<!-- prettier-ignore-start -->

````markdown

``` yaml
{%raw%}{% include 'includes/mkdocs.yml' %}{%endraw%}
```
````

Expands to the full `mkdocs.yml`:

``` yaml
{% include 'includes/mkdocs.yml' %}
```
<!-- prettier-ignore-end -->
