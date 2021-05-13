#!/bin/bash

export LDFLAGS="${LDFLAGS} -L$PREFIX/lib -lssl"

if [[ "$CONDA_BUILD_CROSS_COMPILATION" == "1" ]]; then
    cp $BUILD_PREFIX/bin/pg_config $PREFIX/bin/pg_config
    export CFLAGS="${CFLAGS} -I$PREFIX/include -I$PREFIX/include/server"
fi

$PYTHON -m pip install . --no-deps --ignore-installed --no-cache-dir -vvv
