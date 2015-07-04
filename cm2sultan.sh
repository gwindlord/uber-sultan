#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"
VERSION_FILE="$LOCAL_REPO/vendor/cm/config/version.mk"

# reverting vendor_cm -> vendor_ubercm
pushd $LOCAL_REPO/vendor/cm

  sed -i 's#ubercm_bacon#cm_bacon#' "vendorsetup.sh"
  git add $(git status -s | awk '{print $2}')
  git commit -m "Re-setting bacon target"

  set -e
  git revert 47fa7db2f73061127497f4f22e93fcf8c2df40d0 --rerere-autoupdate || git revert --continue
  set +e
popd

pushd $LOCAL_REPO/build/ && git revert 915bd50f21525f12b6784ffbc8a0ddb8e0c065f1 --no-edit && popd

# setting UberSultan
pushd $(dirname "$VERSION_FILE")

  sed -i 's#UberCM#UberSultan#' "$VERSION_FILE"
  sed -i 's#UBERCM_BUILD#CM_BUILD#' "$VERSION_FILE"

  git add $(git status -s | awk '{print $2}')
  git commit -m "Renaming ROM to UberSultan :)"

popd
