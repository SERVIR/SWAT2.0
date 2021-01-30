import os
import sys
from setuptools import setup, find_namespace_packages
from tethys_apps.app_installation import find_resource_files

### Apps Definition ###
app_package = 'swat2'
release_package = 'tethysapp-' + app_package
resource_files = find_resource_files('tethysapp/' + app_package + '/templates','tethysapp/' + app_package )
resource_files += find_resource_files('tethysapp/' + app_package + '/public','tethysapp/' + app_package )
### Python Dependencies ###
dependencies = []

setup(
    name=release_package,
    version='0.0.1',
    tags='&quot;Hydrology&quot;, &quot;Soil&quot;, &quot;Water&quot;, &quot;Timeseries&quot;',
    description='Application to access and analyse inputs and outputs of the Soil and Water Assessment Tool (SWAT)',
    long_description='',
    keywords='',
    author='Spencer McDonald',
    author_email='spencer.mcdonald@adpc.net',
    url='',
    license='MIT',
    packages=find_namespace_packages(),
    include_package_data=True,
    package_data={'': resource_files},
    zip_safe=False,
    install_requires=dependencies,
)
