#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"
BOARD_CONFIG="$LOCAL_REPO/device/oneplus/bacon/BoardConfig.mk"
KERNEL_INCLUDES="$LOCAL_REPO/kernel/oneplus/msm8974/include/linux"
AK_KERNEL_URL="https://raw.githubusercontent.com/anarkia1976/AK-OnePone-Reborn"

pushd $(dirname "$BOARD_CONFIG")

  sed -i 's/# Bluetooth/KERNEL_TOOLCHAIN_PREFIX := arm-eabi-\nKERNEL_TOOLCHAIN := "\$\(ANDROID_BUILD_TOP\)\/prebuilts\/gcc\/\$\(HOST_OS\)-x86\/arm\/arm-eabi-4.8\/bin\/"\n\n# Bluetooth/' "$BOARD_CONFIG"

  git add $(git status -s | awk '{print $2}')
  git commit -m "Setting Uber toolchain"

popd

exit 0

# trying to include GCC 5 support from AK kernel (to set Uber above to 5.1 version) - yet unsuccessfully
pushd $KERNEL_INCLUDES"

  git remote add ak "$AK_KERNEL_URL"
  git fetch ak
  git cherry-pick ca45de202b8c87c2cda6788f45401f21c9522bee
  git cherry-pick f2ba02a6cb876f6b5e13dae4012d05023bef1d80
  git cherry-pick 5cd2527d50f73639f9f9a4bb0ef3a5ad2a54c90a

  git add $(git status -s | awk '{print $2}')
  git commit -m "Adding GCC 5 support"

popd
