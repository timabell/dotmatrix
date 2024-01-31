#!/bin/sh -v
# Fix non-functioning F1-12 keys.
# Requires root

# https://gist.github.com/andrebrait/961cefe730f4a2c41f57911e6195e444

# https://help.ubuntu.com/community/AppleKeyboard#Change_Function_Key_behavior
# 0 = disabled : Disable the 'fn' key. Pressing 'fn'+'F8' will behave like you only press 'F8'
# 1 = fkeyslast : Function keys are used as last key. Pressing 'F8' key will act as a special key. Pressing 'fn'+'F8' will behave like a F8.
# 2 = fkeysfirst : Function keys are used as first key. Pressing 'F8' key will behave like a F8. Pressing 'fn'+'F8' will act as special key (play/pause). 

echo "options hid_apple fnmode=2" >> /etc/modprobe.d/hid_apple.conf
# the "-k all" part is not always needed, but it's better to do that for all kernels anyway
update-initramfs -u -k all

# Update in memory
echo 2 > /sys/module/hid_apple/parameters/fnmode

echo "now reboot"
