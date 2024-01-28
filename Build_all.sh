#!/bin/bash
export SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

mkdir $SCRIPT_DIR/build
mkdir $SCRIPT_DIR/build/log

tput setaf 8
echo "#############################################################################################"
echo "###################                Installing Build Depends            ######################"
echo "#############################################################################################"
tput sgr0

sudo pacman -S pacman-contrib cmake cppdap jsoncpp rhash boost extra-cmake-modules yaml-cpp hwinfo qt5-xmlpatterns squashfs-tools libpwquality appstream-qt --needed --noconfirm

if ! pacman -Qi ckbcomp > /dev/null; then
    git clone https://aur.archlinux.org/ckbcomp.git
    cd $SCRIPT_DIR/ckbcomp
    yes | makepkg -si
    cd $SCRIPT_DIR
fi


( bash $SCRIPT_DIR/KABI-Calamares/build.sh )|& tee $SCRIPT_DIR/build/log/KABI-Calamares.log

( bash $SCRIPT_DIR/calamares-tool/build.sh )|& tee $SCRIPT_DIR/build/log/calamares-tool.log

( bash $SCRIPT_DIR/KABI-Calamares-Config/build.sh )|& tee $SCRIPT_DIR/build/log/KABI-Calamares-Config.log

( bash $SCRIPT_DIR/snapper-support/build.sh )|& tee $SCRIPT_DIR/build/log/snapper-support.log

( bash $SCRIPT_DIR/KAB-pfetch/build.sh )|& tee $SCRIPT_DIR/build/log/KAB-pfetch.log

( bash $SCRIPT_DIR/plasma-theme-KABI/build.sh )|& tee $SCRIPT_DIR/build/log/plasma-theme-KABI.log

( bash $SCRIPT_DIR/kora-icon-theme/build.sh )|& tee $SCRIPT_DIR/build/log/kora-icon-theme.log


tput setaf 2
echo "#############################################################################################"
echo "###################                    ALL build done                  ######################"
echo "#############################################################################################"
tput sgr0
