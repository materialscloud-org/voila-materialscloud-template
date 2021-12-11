from pathlib import Path
from subprocess import check_call

from setuptools import setup
from setuptools.command.develop import develop
from setuptools.command.install import install

def post_install():
    """Copy materialscloud templates' files to Jupyter config location"""
    for template in ("materialscloud", "materialscloud-iframe"):
        check_call(['./copy_voila_template.py', template], cwd=TOP_DIR)

class ExtraInstall(install):
    """Post-installation for installation (install) mode."""

    def run(self):
        """Install application and copy template files to Jupyter location afterwards."""
        install.run(self)
        post_install()


class ExtraDevelop(develop):
    """Post-installation for editable (develop) mode."""

    def run(self):
        """Install application and copy template files to Jupyter location afterwards."""
        develop.run(self)
        post_install()


TOP_DIR = Path(__file__).parent.resolve()

with open(TOP_DIR.joinpath("README.md")) as handle:
    README = handle.read()

with open(TOP_DIR.joinpath("requirements_base.txt")) as handle:
    REQUIREMENTS_BASE = [f"{_.strip()}" for _ in handle.readlines() if " " not in _]

with open(TOP_DIR.joinpath("requirements_dev.txt")) as handle:
    REQUIREMENTS_DEV = [f"{_.strip()}" for _ in handle.readlines() if " " not in _]


setup(
    name='voila-materialscloud-template',
    version='0.3.7',
    packages=[],
    author='Dou Du and Casper Welzel Andersen',
    author_email='dou.du@epfl.ch',
    url='https://github.com/materialscloud-org/voila-materialscloud-template',
    license='BSD',
    description='Voilà template for Materials Cloud that implements the Materials Cloud header and CSS.',
    long_description=README,
    long_description_content_type='text/markdown',
    keywords='voila jupyter materialscloud',
    cmdclass={
        'develop': ExtraDevelop,
        'install': ExtraInstall,
    },
    install_requires=REQUIREMENTS_BASE,
    extras_require={'dev': REQUIREMENTS_DEV}
)
