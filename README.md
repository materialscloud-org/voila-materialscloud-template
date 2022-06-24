# Voilà template for Materials Cloud  

This is the Voilà template for the Materials Cloud project.

It implements the standard Materials Cloud header and CSS.

The template is called `materialscloud` and can be invoked either by using the `--template=materialscloud` `voila` CLI option, setting it explicitly in a Notebook's metadata or in a Jupyter config file.
See [the Voilà documentation](https://voila.readthedocs.io/en/stable/customize.html#controlling-the-nbconvert-template) on how to invoke templates for more information.

## Try it with Binder!

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/materialscloud-org/voila-materialscloud-template/develop?urlpath=%2Fvoila%2Frender%2Fexample-notebooks%2Fexample.ipynb)

## Installation

```bash
pip install voila-materialscloud-template
```

## Usage

There are two different templates for deploying Voilà at Materials Cloud website, which are "materialscloud-tool" and "materialscloud-discover".

At [Materials Cloud](https://materialscloud.org), the [WORK](https://www.materialscloud.org/work) section have a collection of simulation tools and services. To deploy such applications, one need use the "materialscloud-tool" template as:

```bash
voila --template=materialscloud-tool example.ipynb
```

In the [DISCOVER](https://www.materialscloud.org/discover) section, it shows curated research data with tailored visualizations. One need to use the "materialscloud-discover" template
to deploy the apps.

```bash
voila --template=materialscloud-discover example.ipynb
```

## License

This repository and all files in it are licensed under the [BSD license](LICENSE), copyright (c) by Voilà contributors.
