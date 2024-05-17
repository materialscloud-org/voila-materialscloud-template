# Voilà template for Materials Cloud
[![PyPI - Version](https://img.shields.io/pypi/v/voila-materialscloud-template?color=4CC61E)](https://pypi.org/project/voila-materialscloud-template/)
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/materialscloud-org/voila-materialscloud-template/main?urlpath=%2Fvoila%2Frender%2Fexample-notebooks%2Fexample.ipynb)

This is the Voilà template for Materials Cloud, implements the standard header and CSS.

Three templates are provided:
* `materialscloud-tool` - highlights the [WORK](https://www.materialscloud.org/work)/Tools section in the header/breadcrumbs.
* `materialscloud-discover` - highlights the [DISCOVER](https://www.materialscloud.org/discover) section in the header/breadcrumbs.
* `materialscloud-iframe` - just adds a simple "Hosted on Materials Cloud" note at the bottom.

## Installation

```bash
pip install voila-materialscloud-template
```

This installs the templates in the correct Jupyter path (using `copy_voila_template.py`).

## Usage

The main way is to use the `voila --template` option, e.g.:

```bash
voila --template=materialscloud-tool example.ipynb
```
Alternatively, you can write a `voila.json` file containing

```json
{
  "VoilaConfiguration": {
    "template": "materialscloud-tool"
  },
  ...
}
```

and passing its path with

```bash
voila --Voila.config_file_paths=<...> example.ipynb
```

There are also other options, see [the Voilà documentation](https://voila.readthedocs.io/en/stable/customize.html#controlling-the-nbconvert-template) for more information.

## Development

Option 1:

```bash
pip install -e .[dev]
```

Note: this will copy the templates to the jupyter folder, and they need to be modified directly there or re-copied if new tests are required.

Option 2:

It's more convenient to use a docker container and rebuild after modification:

```bash
cd docker
docker compose up --build
```

and access via `http://localhost:8866/`. The template and other voila configuration is specified in `voila.json`.

Note: maybe there is an easier setup, e.g. with live-reload or similar.

### Making a new release

To release a new version, just make a new release on Github with the correct version tag, without updating any versions manually. This will start the GitHub action that will
* update version numbers in the repo and commits it;
* tags this new commit with the version, overwriting the tag that was made by the Github release;
* pushes commit & tag to Github;
* publishes new version on PYPI.

## License

This repository and all files in it are licensed under the [BSD license](LICENSE), copyright (c) by Voilà contributors.
