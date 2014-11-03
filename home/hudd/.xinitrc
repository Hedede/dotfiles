#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

Section "InputDevice"
	Driver "kbd"
	Option "CoreKeyboard"
	Option "XkbRules" "xorg"
	Option "XkbModel" "pc105"
	Option "XkbLayout" "us,ru"
	Option "XkbOptions" "grp:alt_shift_toggle,grp_led:scroll,compose:lwin" 
EndSection

# exec gnome-session
# exec startkde
exec startxfce4
# ...or the Window Manager of your choice
