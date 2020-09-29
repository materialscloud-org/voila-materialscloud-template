from setuptools import setup
import os

data_files = []
for root, dirs, files in os.walk('share'):
    root_files = [os.path.join(root, i) for i in files]
    data_files.append((root, root_files))

setup_args = {
    'name': 'voila-materialscloud-template',
    'version': '0.1.1',
    'packages': [],
    'data_files': data_files,
    'install_requires': ['voila~=0.2.3'],
    'author': 'Dou Du and Casper Welzel Andersen',
    'url': 'https://github.com/materialscloud-org/materialscloud-voila-template'
}

if __name__ == '__main__':
    setup(**setup_args)
