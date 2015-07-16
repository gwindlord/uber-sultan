#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"
DEVICE_REPO="$LOCAL_REPO/device/oppo/msm8974-common/"
SETTINGS_REPO="$LOCAL_REPO/packages/apps/Settings"

# taking probable fix of microphone issue (http://review.cyanogenmod.org/#/c/102459/)
pushd "$DEVICE_REPO"

  git fetch http://review.cyanogenmod.org/CyanogenMod/android_device_oppo_msm8974-common refs/changes/59/102459/4 && git cherry-pick FETCH_HEAD
  git commit --allow-empty

popd

pushd "$SETTINGS_REPO"

  sed -i "s#UberCM build#Build#" res/values/ubercm_strings.xml

  git add $(git status -s | awk '{print $2}')
  git commit -m "Setting more common build name string"

popd
