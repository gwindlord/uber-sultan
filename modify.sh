#!/bin/bash

SCRIPT_DIR="$(dirname $(readlink -f $0))"

# converting UberCM to UberSultan
$SCRIPT_DIR/cm2sultan.sh

# turning Sultan's CPU underclock off
$SCRIPT_DIR/turn_off_underclock.sh

# setting custom camera as system one
$SCRIPT_DIR/set_customcamera.sh

# setting Uber version (currently works only for 4.8 - even 4.9 causes data alignment segfaults while working)
# now taking some commits from DerRommeister and building kernel with 6.0 :)
$SCRIPT_DIR/set_uber.sh

# copying old touchscreen firmware to kernel
#$SCRIPT_DIR/touchscreen_drivers/copy_old_sultan_firmware.sh

# setting GPS configuration for Belarus
$SCRIPT_DIR/bel_gps/copy_gps_conf.sh

# any additional actions
$SCRIPT_DIR/additional.sh
