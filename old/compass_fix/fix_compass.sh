#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"
SCRIPT_DIR="$(dirname $(readlink -f $0))"
COMPASS_CONF_DIR="$LOCAL_REPO/vendor/oneplus/bacon/proprietary/etc"

# compass fix (at least it works for me)
pushd "$"

  cp -f $SCRIPT_DIR/sensor_def_qcomdev.conf .
  git add $(git status -s | awk '{print $2}')
  git commit -m "Changing compass values in order to fix it"

popd