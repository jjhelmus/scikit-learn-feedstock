#!/bin/bash

if [ "$blas_impl" = "mkl" ]; then

    cat > site.cfg <<EOF
[mkl]
library_dirs = $PREFIX/lib
include_dirs = $PREFIX/include
mkl_libs = mkl_rt
lapack_libs =

EOF

else # Non-MKL

    cat > site.cfg <<EOF
[DEFAULT]
library_dirs = $PREFIX/lib
include_dirs = $PREFIX/include

[atlas]
atlas_libs = openblas
libraries = openblas

[openblas]
libraries = openblas
library_dirs = $PREFIX/lib
include_dirs = $PREFIX/include

EOF

fi

"${PYTHON}" setup.py install --single-version-externally-managed --record record.txt
