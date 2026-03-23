#!/bin/sh -v
cat /proc/sys/fs/inotify/max_user_instances

echo 'fs.inotify.max_user_instances = 524288' | sudo tee /etc/sysctl.d/90-inotify.conf
sudo sysctl -p /etc/sysctl.d/90-inotify.conf

cat /proc/sys/fs/inotify/max_user_instances
