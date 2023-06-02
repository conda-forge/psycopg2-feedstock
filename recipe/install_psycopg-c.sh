#!/usr/bin/env bash

set -e

cd psycopg-c

export LDSHARED=$(${PYTHON} ${RECIPE_DIR}/get_ldshared.py)

echo CC: ${CC}
echo LDSHARED: ${LDSHARED}

${PYTHON} -m pip install . -vv --no-deps
