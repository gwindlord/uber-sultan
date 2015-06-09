#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"
BOARD_CONFIG="$LOCAL_REPO/device/oneplus/bacon/BoardConfig.mk"

pushd $(dirname "$BOARD_CONFIG")

  sed -i 's/# Bluetooth/KERNEL_TOOLCHAIN_PREFIX := arm-eabi-\nKERNEL_TOOLCHAIN := "\$\(ANDROID_BUILD_TOP\)\/prebuilts\/gcc\/\$\(HOST_OS\)-x86\/arm\/arm-eabi-5.1\/bin\/"\n\n# Bluetooth/' "$BOARD_CONFIG"

  git add $(git status -s | awk '{print $2}')
  git commit -m "Setting Uber toolchain"

popd
