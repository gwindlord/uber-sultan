#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"
GPS_CONF_DIR="$LOCAL_REPO/device/oppo/msm8974-common/gps"

pushd "$GPS_CONF_DIR"

  cp -f $(dirname $(readlink -f $0))/gps.conf .
  git add $(git status -s | awk '{print $2}')
  git commit -m "Adding GPS configuration file for Belarus"

popd
