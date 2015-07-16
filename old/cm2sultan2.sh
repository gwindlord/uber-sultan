#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"
MAKEFILE="$LOCAL_REPO/build/core/Makefile"
COMMON_FILE="$LOCAL_REPO/vendor/cm/config/common.mk"
DEVICE_REPO="$LOCAL_REPO/device/oneplus/bacon"

pushd "$DEVICE_REPO"

  git revert 7f8e0047cfe28f2f3167e29bc158fb9b979644d8 --continue

popd

exit 0

pushd $(dirname "$MAKEFILE")

  sed -i 's#cm-$(CM_VERSION)#UberSultan-$(CM_VERSION)#' "$MAKEFILE"

  git add $(git status -s | awk '{print $2}')
  git commit -m "Renaming ROM to UberSultan :)"

popd

pushd $(dirname "$COMMON_FILE")

  sed -i 's#+%Y%m%d#+%Y%m%d-%H%M#' "$COMMON_FILE"

  git add $(git status -s | awk '{print $2}')
  git commit -m "Renaming ROM to UberSultan :)"

popd
