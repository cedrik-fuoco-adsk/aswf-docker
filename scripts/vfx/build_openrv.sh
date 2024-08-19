#!/usr/bin/env bash
# Copyright (c) Contributors to the aswf-docker Project. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

set -ex

mkdir openrv
cd openrv
git clone --recursive https://github.com/AcademySoftwareFoundation/OpenRV.git .


# Take latest from main for now.

# if [[ $ASWF_OPENRV_VERSION == 2.0* || $ASWF_OPENRV_VERSION == 2.1* || $ASWF_OPENRV_VERSION == 2.2*  ]]; then
#     OPENRV_TAG="Release-${ASWF_OPENRV_VERSION}"
# else
#     OPENRV_TAG="v${ASWF_OPENRV_VERSION}"
# fi

# if [ "$ASWF_OPENRV_VERSION" != "latest" ]; then
#     git checkout "tags/$OPENRV_TAG" -b $OPENRV_TAG
# fi

cmake -B _build \
      -G Ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DRV_DEPS_QT5_LOCATION=/usr/local

cmake --build _build \
      --target dependencies \
      --parallel=1 \
      -v
      
cmake --build _build \
      --target main_executable \
      --parallel \
      -v

cmake --install _build --prefix ~/openrv_install

cd ../..
rm -rf openrv
