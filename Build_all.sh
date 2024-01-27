#!/bin/bash
export SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

mkdir $SCRIPT_DIR/build

tput setaf 8
echo "#############################################################################################"
echo "###################                Installing Build Depends            ######################"
echo "#############################################################################################"
tput sgr0

sudo pacman -S pacman-contrib


( bash $SCRIPT_DIR/KABI-Calamares/build.sh )|& tee $SCRIPT_DIR/build/KABI-Calamares.log

( bash $SCRIPT_DIR/KABI-Calamares-Config/build.sh )|& tee $SCRIPT_DIR/build/KABI-Calamares-Config.log

( bash $SCRIPT_DIR/plasma-theme-KABI/build.sh )|& tee $SCRIPT_DIR/build/plasma-theme-KABI.log

( bash $SCRIPT_DIR/snapper-support/build.sh )|& tee $SCRIPT_DIR/build/snapper-support.log

( bash $SCRIPT_DIR/timeshift-support/build.sh )|& tee $SCRIPT_DIR/build/timeshift-support.log

( bash $SCRIPT_DIR/kora-icon-theme/build.sh )|& tee $SCRIPT_DIR/build/kora-icon-theme.log

( bash $SCRIPT_DIR/calamares-tool/build.sh )|& tee $SCRIPT_DIR/build/calamares-tool.log

tput setaf 8
echo "#############################################################################################"
echo "###################                       build done                   ######################"
echo "#############################################################################################"
tput sgr0
