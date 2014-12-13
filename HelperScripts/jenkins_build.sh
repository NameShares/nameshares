#!/bin/bash -xe
cd $WORKSPACE/nameshares
git submodule init
git submodule update
mkdir $WORKSPACE/build
cd $WORKSPACE/build
export NAMESHARES_ROOT=$WORKSPACE
. ../nameshares/setenv.sh
cmake -DINCLUDE_QT_WALLET=TRUE -DCMAKE_TOOLCHAIN_FILE=$WORKSPACE/toolchain.invictus/toolchain.invictus.cmake ../nameshares
make -j8 VERBOSE=1
