#!/bin/sh

mkdir -p themes
cd themes

wget -nc -O NumixSolarized-20210831.tar.gz \
    https://github.com/Ferdi265/numix-solarized-gtk-theme/releases/download/20210831/NumixSolarized-20210831.tar.gz
tar xvfz NumixSolarized-20210831.tar.gz NumixSolarized/NumixSolarizedDarkBlue

