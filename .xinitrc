# System xinitrc files
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# fix Logitech mouse
DEVICE_ID=$(xinput list |  grep "Logitech Gaming Mouse G300" | grep keyboard | sed 's/.*id=\([0-9]*\).*/\1/')

if xinput -list-props $DEVICE_ID | grep "Device Enabled" | grep "1$" > /dev/null
then
        xinput set-int-prop $DEVICE_ID "Device Enabled" 8 0
fi

~/.bin/xorg-keyboard;

startxfce4;
#xmonad;
