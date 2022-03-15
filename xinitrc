# FIXME(parsiad): Ugly hack.
(sleep 5s && dunst) &
(sleep 5s && nm-applet) &

xrdb ~/.Xresources
exec i3
