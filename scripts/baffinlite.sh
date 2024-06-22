#!/bin/bash
# based on the instructions from edk2-platform
set -e
. ./scripts/build_common.sh
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
GCC5_ARM_PREFIX=arm-linux-gnueabi- build -j$(nproc) -s -n 0 -a ARM -t GCC5 -p MSM8909Pkg/Devices/baffinlite.dsc
./scripts/build_bootshim.sh
cat BootShim/BootShim.bin workspace/Build/MSM8909Pkg/DEBUG_GCC5/FV/MSM8909PKG_UEFI.fd > workspace/kernel-baffinlite.img-kernel
