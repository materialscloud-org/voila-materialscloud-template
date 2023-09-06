"""Copied from 'copy_voila_template.py'"""
import json
import os
from pathlib import Path
from typing import Any, Dict, Tuple


def get_voila_templates_dir() -> Tuple[Path, Path]:
    """Find absolute path to Jupyter's data dir that contains Voilà templates"""
    jupyter_dirs = os.popen("jupyter --paths --json")
    try:
        jupyter_dirs: Dict[str, Any] = json.loads(jupyter_dirs.read())
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
