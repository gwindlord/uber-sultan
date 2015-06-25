#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"
FRAMEWORKS_DIR="$LOCAL_REPO/frameworks/base"

pushd "$FRAMEWORKS_DIR"

  # taking frameworks CM commit - until Robbie merges it into UberCM, this will prevent build failure
  git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_base refs/changes/30/100830/3 && git cherry-pick FETCH_HEAD

popd
