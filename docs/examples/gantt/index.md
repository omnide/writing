---
title: Gantt
---

# :fontawesome-solid-chart-gantt: Gantt

Read more about the gantt plugin in the
[documentation from neoteroi](https://www.neoteroi.dev/mkdocs-plugins/gantt/).

[gantt no-quarters no-weeks no-days(./docs/examples/gantt/gantt.yaml)]

## Configuration

The gantt chart above uses a separate yaml file. Note the path relative to the parent directory of
the `mkdocs.yml` file.

```text
[gantt no-quarters no-weeks no-days(./docs/examples/gantt/gantt.yaml)]
```

The definitions themselves from `gantt.yaml` are:

<!-- prettier-ignore-start -->
``` yaml
{% include 'examples/gantt/gantt.yaml' %}
```
<!-- prettier-ignore-end -->
