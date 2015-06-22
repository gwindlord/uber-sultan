#!/bin/bash

SCRIPT_DIR="$(dirname $(readlink -f $0))"

$SCRIPT_DIR/set_cameranextmod.sh
$SCRIPT_DIR/set_uber.sh
$SCRIPT_DIR/touchscreen_drivers/copy_old_sultan_firmware.sh