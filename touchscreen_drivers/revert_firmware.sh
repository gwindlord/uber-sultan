#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"
ROM_TOUCH_DIR="$LOCAL_REPO/kernel/oneplus/msm8974/drivers/input/touchscreen/"

pushd "$ROM_TOUCH_DIR"

  git reset --hard HEAD^

popd
