#!/bin/bash

cp -r ${RECIPE_DIR}/psycopg2-binary .
cd psycopg2-binary
$PYTHON -m pip install . --no-deps --ignore-installed --no-cache-dir -vvv
