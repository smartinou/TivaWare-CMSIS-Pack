#!/usr/bin/env bash
# Version: 3.0
# Date: 2023-11-06
# This bash script generates a CMSIS Software Pack:
#

set -o pipefail

# Set version of gen pack library
# For available versions see https://github.com/Open-CMSIS-Pack/gen-pack/tags.
# Use the tag name without the prefix "v", e.g., 0.7.0
REQUIRED_GEN_PACK_LIB="0.9.0"

# Set default command line arguments
DEFAULT_ARGS=(--preprocess)

# Pack warehouse directory - destination
# Default: ./output
#
PACK_OUTPUT=./output

# Temporary pack build directory,
# Default: ./build
#
PACK_BUILD=./build

# Specify directory names to be added to pack base directory
# An empty list defaults to all folders next to this script.
# Default: empty (all folders)
PACK_DIRS="
    tivaware/boot_loader/
    tivaware/driverlib/
    tivaware/grlib/
    tivaware/inc/
    tivaware/sensorlib/
    tivaware/usblib/
    tivaware/utils/
"
    # tivaware/docs/
    # tivaware/examples/
    # tivaware/third_party/
    # tivaware/tools/
    # tivaware/windows_drivers/

# Specify file names to be added to pack base directory
# Default: empty
PACK_BASE_FILES="
    tivaware/EULA.txt
    tivaware/license.html
    tivaware/TI-BSD-EULA.txt
"

# Specify file names to be deleted from pack build directory
# Default: empty
PACK_DELETE_FILES="
    tivaware/driverlib/ccs/
    tivaware/driverlib/driverlib.*
    tivaware/driverlib/ewarm/
    tivaware/driverlib/gcc/
    tivaware/driverlib/Makefile
    tivaware/driverlib/rvmdk/
    tivaware/grlib/binfonts/
    tivaware/grlib/ccs/
    tivaware/grlib/ewarm/
    tivaware/grlib/gcc/
    tivaware/grlib/grlib.ewp
    tivaware/grlib/grlib.uvopt
    tivaware/grlib/grlib.uvproj
    tivaware/grlib/Makefile
    tivaware/grlib/rvmdk/
    tivaware/sensorlib/ccs/
    tivaware/sensorlib/ewarm/
    tivaware/sensorlib/gcc/
    tivaware/sensorlib/Makefile
    tivaware/sensorlib/rvmdk/
    tivaware/sensorlib/sensorlib.*
    tivaware/usblib/ccs/
    tivaware/usblib/ewarm/
    tivaware/usblib/gcc/
    tivaware/usblib/Makefile
    tivaware/usblib/rvmdk/
    tivaware/usblib/usblib.ewp
    tivaware/usblib/usblib.uvopt
    tivaware/usblib/usblib.uvproj
"

# Specify patches to be applied
# Default: empty
#
PACK_PATCH_FILES="
    diff.patch
"

# Specify addition argument to packchk
# Default: empty
#
#PACKCHK_ARGS=()

# Specify additional dependencies for packchk
# Default: empty
PACKCHK_DEPS="
"

# Optional: restrict fallback modes for changelog generation
# Default: full
# Values:
# - full      Tag annotations, release descriptions, or commit messages (in order)
# - release   Tag annotations, or release descriptions (in order)
# - tag       Tag annotations only
#
# PACK_CHANGELOG_MODE="<full|release|tag>"

TIVAWARE_VERSION="v2.2.0.295"

#
# custom pre-processing steps
#
# usage: preprocess <build>
#   <build>  The build folder
#
function preprocess() {
  # add custom steps here to be executed
  # before populating the pack build folder
  # Create a clean folder.
  TIVAWARE_DIR=tivaware
  if [ -d "$TIVAWARE_DIR" ]; then
    rm -rf $TIWARE_DIR
  fi
  mkdir $TIVAWARE_DIR
  cd $TIVAWARE_DIR

  # Acquire sources from repos.
  # Change line ending. Required to apply patch.
  unzip -q -o $HOME/Downloads/SW-TM4C-2.2.0.295.exe
  find . -type f -print0 | xargs -0 dos2unix -q

  cd .. # Back to script calling point.

  return 0
}

#
# custom post-processing steps
#
# usage: postprocess <build>
#   <build>  The build folder
#
function postprocess() {
  # add custom steps here to be executed
  # after populating the pack build folder
  # but before archiving the pack into output folder
  return 0
}

############ DO NOT EDIT BELOW ###########

# Set GEN_PACK_LIB_PATH to use a specific gen-pack library root
# ... instead of bootstrap based on REQUIRED_GEN_PACK_LIB
if [[ -f "${GEN_PACK_LIB_PATH}/gen-pack" ]]; then
  . "${GEN_PACK_LIB_PATH}/gen-pack"
else
  . <(curl -sL "https://raw.githubusercontent.com/Open-CMSIS-Pack/gen-pack/main/bootstrap")
fi

gen_pack "${DEFAULT_ARGS[@]}" "$@"

exit 0
