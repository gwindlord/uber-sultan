#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"

# msm8974: Add missing adaptive playback tag
# msm8974-common: Fix USB ethernet support
# msm8974-common: Update firmware symlinks
pushd "$LOCAL_REPO/device/oppo/msm8974-common"

  git remote add uber_oppo https://github.com/UberCM/device_oppo_msm8974-common.git
  git fetch uber_oppo
  git cherry-pick c5364da38326f7f179efe3d53c7f28dc9fbcfd31
  git cherry-pick 3069cf801f993f63c8c652f5bffee177327844ca
  git cherry-pick 3c78ec8ae2970002957f3ebfc7594812ff93e488
  git remote rm uber_oppo

popd
