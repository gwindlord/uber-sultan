#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"

# msm8974: Add missing adaptive playback tag
pushd "$LOCAL_REPO/device/oppo/msm8974-common"

  git remote add uber_oppo https://github.com/UberCM/device_oppo_msm8974-common.git
  git fetch uber_oppo
  git cherry-pick c5364da38326f7f179efe3d53c7f28dc9fbcfd31
  git remote rm uber_oppo

popd
