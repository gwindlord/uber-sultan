#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"
ROM_TOUCH_DIR="$LOCAL_REPO/kernel/oneplus/msm8974/drivers/input/touchscreen/"
SOURCE_TOUCH_DIR="$(dirname $(readlink -f $0))/sultan_old"

pushd "$ROM_TOUCH_DIR"

  cp -f $SOURCE_TOUCH_DIR/* .

  git add $(git status -s | awk '{print $2}')
  git commit -m "Reverting to old touchscreen firmware for Sultanxda kernel"

popd
