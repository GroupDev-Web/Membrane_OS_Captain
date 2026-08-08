#!/usr/bin/env bash
set -euo pipefail
useradd -m -G wheel,video,audio,storage -s /bin/bash liveuser
passwd -d liveuser
printf 'liveuser ALL=(ALL:ALL) NOPASSWD: ALL\n' > /etc/sudoers.d/10-liveuser
chmod 440 /etc/sudoers.d/10-liveuser
systemctl enable NetworkManager sddm
mkdir -p /home/liveuser/.config
cp -a /etc/skel/. /home/liveuser/
chown -R liveuser:liveuser /home/liveuser
