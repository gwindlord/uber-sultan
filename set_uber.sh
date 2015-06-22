#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"
BOARD_CONFIG="$LOCAL_REPO/device/oneplus/bacon/BoardConfig.mk"
KERNEL_INCLUDES="$LOCAL_REPO/kernel/oneplus/msm8974/"
AK_KERNEL_URL="https://github.com/anarkia1976/AK-OnePone-Reborn.git"
LIBCORE_DIR="$LOCAL_REPO/libcore"

pushd $(dirname "$BOARD_CONFIG")

  sed -i 's/# Bluetooth/KERNEL_TOOLCHAIN_PREFIX := arm-eabi-\nKERNEL_TOOLCHAIN := "\$\(ANDROID_BUILD_TOP\)\/prebuilts\/gcc\/\$\(HOST_OS\)-x86\/arm\/arm-eabi-4.8\/bin\/"\n\n# Bluetooth/' "$BOARD_CONFIG"

  git add $(git status -s | awk '{print $2}')
  git commit -m "Setting Uber toolchain"

popd

exit 0

# taking Google's fix for GCC 4.9 (https://android-review.googlesource.com/#/c/143200/) - cannot build tests, multiple compilation errors
pushd "$LIBCORE_DIR"

  git fetch https://android.googlesource.com/platform/libcore refs/changes/00/143200/5 && git cherry-pick FETCH_HEAD

popd



# trying to include GCC 5 support from AK kernel (to set Uber above to 5.1 version) - yet unsuccessfully
pushd "$KERNEL_INCLUDES"

  git remote add ak "$AK_KERNEL_URL"
  git fetch ak
  git cherry-pick ca45de202b8c87c2cda6788f45401f21c9522bee
  git cherry-pick f2ba02a6cb876f6b5e13dae4012d05023bef1d80
  git cherry-pick 5cd2527d50f73639f9f9a4bb0ef3a5ad2a54c90a

  git add $(git status -s | awk '{print $2}')
  git commit -m "Adding GCC 5 support"

popd
