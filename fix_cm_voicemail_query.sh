#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"
FRAMEWORKS_DIR="$LOCAL_REPO/frameworks/base/"

pushd "$FRAMEWORKS_DIR"
  git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_base refs/changes/08/100108/4 && git cherry-pick FETCH_HEAD
popd
