#!/bin/sh -v
# android screen mirroring
# https://github.com/Genymobile/scrcpy
# https://github.com/Genymobile/scrcpy/blob/master/doc/linux.md
# The apt is v1, current is v3 so installing from source

# for Debian/Ubuntu
sudo apt install ffmpeg libsdl2-2.0-0 adb wget \
                 gcc git pkg-config meson ninja-build libsdl2-dev \
                 libavcodec-dev libavdevice-dev libavformat-dev libavutil-dev \
                 libswresample-dev libusb-1.0-0 libusb-1.0-0-dev

cd ~/repo/scrcpy
git pull
./install_release.sh
