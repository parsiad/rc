#!/bin/sh

mkdir -p icons
cd icons

wget -nc -O rtl88-Themes-1.0.zip \
    https://github.com/rtlewis88/rtl88-Themes/archive/refs/tags/1.0.zip
unzip -o rtl88-Themes-1.0.zip rtl88-Themes-1.0/Solarized-Colors-gtk-theme-iconpack_1.0.tar.gz
cd rtl88-Themes-1.0
tar xvfz Solarized-Colors-gtk-theme-iconpack_1.0.tar.gz Solarized-Blue-gtk-theme-iconpack
