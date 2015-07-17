#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"
VERSION_FILE="$LOCAL_REPO/vendor/cm/config/version.mk"
VENDOR_REPO="$LOCAL_REPO/vendor/cm"
VENDORSETUP_FILE="vendorsetup.sh"
MAKEFILE="core/Makefile"
CONFIG_FILE="config/common.mk"
BUILD_REPO="$LOCAL_REPO/build/"

# reverting vendor_cm -> vendor_ubercm
pushd "$VENDOR_REPO"

  sed -i 's#ubercm_bacon#cm_bacon#' "$VENDORSETUP_FILE"

  # one more vendor/ubercm revert occurrence fix
  sed -i 's#vendor/ubercm/#vendor/cm/#' "$CONFIG_FILE"

  git add $(git status -s | awk '{print $2}')
  git commit -m "Re-setting bacon target and vx_process_props.py path"

  set -e
  git revert 47fa7db2f73061127497f4f22e93fcf8c2df40d0 --rerere-autoupdate || git revert --continue
  set +e
popd

pushd "$BUILD_REPO"

  # one more vendor/ubercm revert occurrence fix
  sed -i 's#vendor/ubercm/#vendor/cm/#' "$MAKEFILE"

  git add $(git status -s | awk '{print $2}')
  git commit -m "Reverting one more vendor_cm -> vendor_ubercm"

  git revert 915bd50f21525f12b6784ffbc8a0ddb8e0c065f1 --no-edit

popd

# setting UberSultan
pushd $(dirname "$VERSION_FILE")

  sed -i 's#UberCM#UberSultan#' "$VERSION_FILE"
  sed -i 's#UBERCM_BUILD#CM_BUILD#' "$VERSION_FILE"

  git add $(git status -s | awk '{print $2}')
  git commit -m "Renaming ROM to UberSultan :)"

popd
