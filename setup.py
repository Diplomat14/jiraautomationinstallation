from setuptools import setup, find_packages
import os

def readme():
    with open(os.path.dirname(os.path.abspath(__file__)) + '/README.rst') as f:
        return f.read()

setup(
    name='jiraautomationinstallation',
    version='0.1',
    description=readme(),
    long_description=readme(),
    url='',
    author='Aleksey Denysyuk',
    author_email='diplomt@gmail.com',
    license='MIT', #TBD
    packages=find_packages(),
    install_requires=[
        'jacustomization @ git+http://git@github.com/Diplomat14/jiraautomationcustomization.git'
    ],
    include_package_data=True,
    test_suite='nose.collector',
    tests_require=['nose'],
    zip_safe=False
)