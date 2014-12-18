#!/bin/bash
pushd `dirname $0`/.. > /dev/null
: ${NAMESHARES_ROOT:=`pwd -P`}
export NAMESHARES_ROOT
popd > /dev/null
echo "Using: "$NAMESHARES_ROOT "as NAMESHARES_ROOT"

# needed for toolchain.invictus.cmake definitions
export INVICTUS_ROOT=$NAMESHARES_ROOT

export TOOLCHAIN_ROOT=$NAMESHARES_ROOT/toolchain.invictus
export PKG_CONFIG_SYSROOT_DIR=$TOOLCHAIN_ROOT/x86_64-unknown-linux-gnu/sysroot
export PKG_CONFIG_PATH=$TOOLCHAIN_ROOT/x86_64-unknown-linux-gnu/sysroot/usr/lib/pkgconfig

export QTDIR=$NAMESHARES_ROOT/QT 
echo "Using: "$QTDIR "as QTDIR"
export ICUROOT=$NAMESHARES_ROOT/ICU

export PATH=$WORKSPACE/build/bin:$QTDIR/bin:$WORKSPACE/build/programs/utils:$WORKSPACE/build/libraries/api:$PATH
export LD_LIBRARY_PATH=$ICUROOT/lib:$QTDIR/lib:$LD_LIBRARY_PATH

export OPENSSL_ROOT=$NAMESHARES_ROOT/openssl
export OPENSSL_ROOT_DIR=$OPENSSL_ROOT
export OPENSSL_INCLUDE_DIR=$OPENSSL_ROOT/include

export DBROOTDIR=$NAMESHARES_ROOT/BerkeleyDB
echo "Using: "$DBROOTDIR "as DBROOTDIR"

export BOOST_ROOT=$NAMESHARES_ROOT/boost_1_55_0

