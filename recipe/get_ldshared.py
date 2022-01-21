#!/usr/bin/env python

from distutils.sysconfig import get_config_vars
import os


# We want to take most of the flags from distutils' version of LDSHARED but
# we want to substitute the environment variable "CC" for anything coming from
# the distutils version of "CC".  This is what happens in conda-forge's
# python >= 3.9 but not in python <= 3.8.  See
# https://github.com/conda-forge/python-feedstock/blob/f9fe6eb7ed384efcec638294e4c2d066df558e99/recipe/patches/0020-Fix-LDSHARED-when-CC-is-overriden-on-Linux-too.patch

old_cc = get_config_vars('CC')[0].split(' ')
ldshared = get_config_vars('LDSHARED')[0].split(' ')

for substr in old_cc:
    ldshared.remove(substr)

cc = os.environ['CC']

ldshared = cc + ' ' + ' '.join(ldshared)

print(ldshared)
