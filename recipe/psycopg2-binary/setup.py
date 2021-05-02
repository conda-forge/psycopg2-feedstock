import os
from setuptools import setup


version = os.environ['PKG_VERSION']

setup(name="psycopg2-binary",
      version=version,
      platforms=["any"],
      python_requires='>=2.7,!=3.0.*,!=3.1.*,!=3.2.*,!=3.3.*',
      description='Metapackage containing psycopg2',
      install_requires=['psycopg2=={}'.format(version)])
