#!/bin/bash

LOCAL_REPO="$HOME/ubersultan"
KERNEL_REPO="$LOCAL_REPO/kernel/oneplus/msm8974"
ROM_TOUCH_DIR="$KERNEL_REPO/drivers/input/touchscreen/"
ROM_KERNEL_UNDERCLOCK_FILE="$KERNEL_REPO/arch/arm/mach-msm/clock-krait-8974.c"
#KERNEL_CONFIG="$KERNEL_REPO/arch/arm/configs/bacon_defconfig"
SOURCE_TOUCH_DIR="$(dirname $(readlink -f $0))/sultan_old"

pushd "$ROM_TOUCH_DIR"

  cp -f $SOURCE_TOUCH_DIR/* .
  # removing CPU underclock
  sed -i 's#if (!strncmp(cpu_uc, "1", 1))#//if (!strncmp(cpu_uc, "1", 1))#' "$ROM_KERNEL_UNDERCLOCK_FILE"

  git add $(git status -s | awk '{print $2}')

  git commit -m "Reverting to old touchscreen firmware and removing CPU underclock for Sultanxda kernel"

popd
