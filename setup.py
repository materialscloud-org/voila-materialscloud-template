from pathlib import Path
from subprocess import check_call

from setuptools import setup
from setuptools.command.develop import develop
from setuptools.command.install import install


def post_install():
    """Copy materialscloud templates' files to Jupyter config location"""
    for template in ("materialscloud", "materialscloud-iframe"):
        check_call(['./copy_voila_template.py', template], cwd=Path(__file__).parent.resolve())

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


setup(
    name='voila-materialscloud-template',
    version='0.3.1',
    packages=[],
    author='Dou Du and Casper Welzel Andersen',
    author_email='dou.du@epfl.ch',
    url='https://github.com/materialscloud-org/voila-materialscloud-template',
    license='BSD',
    description='Voilà template for Materials Cloud that implements the Materials Cloud header and CSS.',
    long_description=open(Path(__file__).parent.joinpath('README.md').resolve()).read(),
    long_description_content_type='text/markdown',
    keywords='voila jupyter materialscloud',
    cmdclass={
        'develop': ExtraDevelop,
        'install': ExtraInstall,
    },
    install_requires=['voila~=0.2.4'],
    extras_require={
        'dev': open(Path(__file__).parent.joinpath('requirements.txt').resolve()).readlines() + ['pylint']
    }
)
