#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then   for f in
/etc/X11/xinit/xinitrc.d/*; do     [ -x "$f" ] && . "$f"   done   unset f fi

if [ -s ~/.Xmodmap ]; then
  xmodmap ~/.Xmodmap
fi

if [ -f ~/.Xresources ]; then
  xrdb -merge ~/.Xresources
fi

export BROWSER="firefox"

if [ -f ~/.xinitrc-local ]; then
  ~/.xinitrc-local
fi

feh --bg-fill --randomize ~/Pictures/wallpapers/* &

exec i3
compton -c -b
