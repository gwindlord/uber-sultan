#!/bin/bash

SCRIPT_DIR="$(dirname $(readlink -f $0))"

$SCRIPT_DIR/set_cameranextmod.sh
$SCRIPT_DIR/cm2sultan.sh
$SCRIPT_DIR/set_uber.sh
$SCRIPT_DIR/touchscreen_drivers/copy_old_sultan_firmware.sh

# temp - until Robbie sync his frameworks/base with CM's
$SCRIPT_DIR/fix_cm_voicemail_query.sh
