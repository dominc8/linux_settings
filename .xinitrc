#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs (This was in the default xinitrc but I don't think it is needed for proper configuration)

#if [ -d /etc/X11/xinit/xinitrc.d ] ; then
# for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
 # [ -x "$f" ] && . "$f"
# done
# unset f
#fi

xset -b                                     # Turn off beep
xset s off -dpms                            # Turn off DPMS and screen blanking
/home/dominik/.config/scripts/xconfig
xcompmgr &                                  # Composite manager needed for transparency etc.
dwmblocks &                                 # Status bar
sct 3000
#safeeyes &                                 # Eyestrain preventing software
systemctl --user import-environment DISPLAY # For dunst
xbindkeys
exec dwm                                    # Windows manager

