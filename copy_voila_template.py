#!/usr/bin/env python3
import os
import json
from pathlib import Path
import shutil
import sys
from typing import Tuple


def get_voila_templates_dir() -> Tuple[Path, Path]:
    """Find absolute path to Jupyter's data dir that contains Voilà templates"""
    jupyter_dirs = os.popen("jupyter --paths --json")
    try:
        jupyter_dirs = json.loads(jupyter_dirs.read())
    except json.JSONDecodeError as exc:
        raise RuntimeError(
            "Could not decode shell command 'jupyter --paths --json' as JSON."
            f"Original exception:\n{exc}"
        )

    for data_dir in jupyter_dirs.get("data", []):
        data_dir = Path(data_dir)
        nbconvert_templates_dir = data_dir / "nbconvert/templates/"
        voila_templates_dir = data_dir / "voila/templates/"
        if voila_templates_dir.exists():
            break
    else:
        for data_dir in jupyter_dirs.get("data", []):
            if ".local" in data_dir:
                data_dir = Path(data_dir)
                # Create "voila/templates/" in this virtualenv-specific config folder
                voila_templates_dir = data_dir / "voila/templates/"
                voila_templates_dir.mkdir(parents=True, exist_ok=True)
                # Create "nbconvert/templates/" in this virtualenv-specific config folder
                nbconvert_templates_dir = data_dir / "nbconvert/templates/"
                nbconvert_templates_dir.mkdir(parents=True, exist_ok=True)
                break
        else:
            raise RuntimeError(
                f"No valid Voilà 'templates' folder found amongst: {jupyter_dirs.get('data', [])!r}. "
                "Also could not find '.local' in any of data directories."
            )

    return voila_templates_dir.resolve(), nbconvert_templates_dir.resolve()


def copy_template(name: str):
    """Copy a Voilà template to Jupyter's first (and best) data dir"""
    src_voila = Path(__file__).parent.joinpath(f'share/jupyter/voila/templates/{name}').resolve()
    src_nbconvert = Path(__file__).parent.joinpath(f'share/jupyter/nbconvert/templates/{name}').resolve()

    for src in (src_voila, src_nbconvert):
        if not src.exists():
            raise RuntimeError(f"Can not find provided template {name!r} at {src} !")

    dest_voila, dest_nbconvert = get_voila_templates_dir()

    for dest in (dest_voila, dest_nbconvert):
        if dest.joinpath(name).exists():
            print(
                f"Template {name!r} has already been copied into {dest}, "
                "will first remove it, then copy it anew !"
            )
            shutil.rmtree(str(dest / name))
            print(f"Successfully removed {dest / name} !")

    for src, dest in zip((src_voila, src_nbconvert), (dest_voila, dest_nbconvert)):
        print(f"Will now copy {src} to {dest / name}.")
        shutil.copytree(src, dest / name, symlinks=False)
        print(f"Successfully copied {name!r} to {dest} !")


if __name__ == "__main__":
    if len(sys.argv) > 1:
        template = sys.argv[1]
    else:
        print("No template supplied to be copied!")
        sys.exit(0)

    try:
        copy_template(template)
    except Exception as exc:  # pylint: disable=broad-except
        sys.exit(f"ERROR while copying template: {exc}")
    else:
        sys.exit(0)
