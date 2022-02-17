#!/bin/sh

if [ ! -z ${PARSIAD_IS_AT_WORK} ]; then
    exit 0
fi

wget -nc -O NumixSolarized-20210831.tar.gz \
    https://github.com/Ferdi265/numix-solarized-gtk-theme/releases/download/20210831/NumixSolarized-20210831.tar.gz
tar xvfz NumixSolarized-20210831.tar.gz

wget -nc -O rtl88-Themes-1.0.zip \
    https://github.com/rtlewis88/rtl88-Themes/archive/refs/tags/1.0.zip
unzip rtl88-Themes-1.0.zip
cd rtl88-Themes-1.0
tar xvfz solarized-dark-gtk-theme-colorpack_1.3.tar.gz

