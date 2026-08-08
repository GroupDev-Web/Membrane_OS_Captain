#!/usr/bin/env bash
set -euo pipefail
useradd -m -G wheel,video,audio,storage -s /bin/bash liveuser
passwd -d liveuser
printf 'liveuser ALL=(ALL:ALL) NOPASSWD: ALL\n' > /etc/sudoers.d/10-liveuser
chmod 440 /etc/sudoers.d/10-liveuser
systemctl enable NetworkManager sddm
# The live image must never stop at systemd's text-mode first-boot wizard.
# Supply the values it checks for and mask the prompt-only service.
ln -sf /usr/share/zoneinfo/UTC /etc/localtime
printf 'LANG=en_US.UTF-8\n' > /etc/locale.conf
systemctl mask systemd-firstboot.service

mkdir -p /home/liveuser/.config
cp -a /etc/skel/. /home/liveuser/
chown -R liveuser:liveuser /home/liveuser
