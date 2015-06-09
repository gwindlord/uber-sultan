#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"
ROM_PACKAGES_MAKEFILE="$LOCAL_REPO/device/oppo/msm8974-common/msm8974.mk"

pushd $(dirname "$ROM_PACKAGES_MAKEFILE")

  sed -i 's/^    libantradio/    libantradio\n\n# CameraNextMod\nPRODUCT_PACKAGES += \\\n    CameraNextMod \\\n    libjni_mosaic_next\n/' "$ROM_PACKAGES_MAKEFILE"

  git add $(git status -s | awk '{print $2}')
  git commit -m "Adding CameraNextMod to the build"

popd
