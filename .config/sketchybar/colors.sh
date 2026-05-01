#!/bin/bash

# Helper function to convert percentage to Hex Alpha
get_alpha() {
  local percent=$1
  # Math: (percent * 255) / 100, then convert to hex
  local val=$(( percent * 255 / 100 ))
  printf "0x%02x" $val
}

# === Rose Pine Moon ===
export BASE=0xff232136
export IRIS=0xffc4a7e7
export LOVE=0xffeb6f92
export TEXT=0xffe0def4

# === Dynamic Opacity Inputs ===
# Input any number (0-100) here:
OPACITY_PERCENT=50

# Logic: Grab the alpha prefix from the function, then append the color (minus its 0xff)
ALPHA_PREFIX=$(get_alpha $OPACITY_PERCENT)
export ACCENT_LIGHT="${ALPHA_PREFIX}${IRIS:4}"

# Other Aliases
export BAR_COLOR=0xd9232136      
export ACCENT_COLOR=$IRIS         
export TEXT_COLOR=$TEXT