#!/bin/bash

export LDFLAGS="${LDFLAGS} -L$PREFIX/lib -lssl"

if [[ "$CONDA_BUILD_CROSS_COMPILATION" == "1" ]]; then
    cp $BUILD_PREFIX/bin/pg_config $PREFIX/bin/pg_config
fi

$PYTHON -m pip install . --no-deps --ignore-installed --no-cache-dir -vvv

if [[ "$target_platform" == osx-* ]]; then
     PG_LIB=$(pg_config --libdir)
     for LIBRARY in $(find ${SP_DIR}/${PKG_NAME} -name "*.so");
     do
        ${OTOOL:-otool} -L $LIBRARY
        ${INSTALL_NAME_TOOL:-install_name_tool} -change libssl.1.0.0.dylib @rpath/libssl.1.0.0.dylib $LIBRARY
        ${INSTALL_NAME_TOOL:-install_name_tool} -change libcrypto.1.0.0.dylib @rpath/libcrypto.1.0.0.dylib $LIBRARY
     done
fi
