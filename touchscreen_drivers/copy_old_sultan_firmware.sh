#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"
ROM_TOUCH_DIR="$LOCAL_REPO/kernel/oneplus/msm8974/drivers/input/touchscreen/"
BOARD_CONFIG="$LOCAL_REPO/device/oneplus/bacon/BoardConfig.mk"
SOURCE_TOUCH_DIR="$(dirname $(readlink -f $0))/sultan_old"

pushd "$ROM_TOUCH_DIR"

  cp -f $SOURCE_TOUCH_DIR/* .

  git add $(git status -s | awk '{print $2}')
  git commit -m "Reverting to old touchscreen firmware for Sultanxda kernel"

popd

exit 0

# turning underclock off makes kernel stuck in constant activity
pushd "$(dirname $(readlink -f $BOARD_CONFIG))"

  sed -i 's#msm_sdcc.1#msm_sdcc.1 no_underclock=1#' "$BOARD_CONFIG"

  git add $(git status -s | awk '{print $2}')
  git commit -m "Removing CPU underclock from Sultanxda kernel"

popd

