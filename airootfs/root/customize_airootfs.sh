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

# Build Membrane's icon, color, Plasma and global-theme packages before the
# live user's profile is created. Dark + Liquid Glue is the default.
/usr/bin/bash /usr/local/lib/membrane-os/install-visual-system
mkdir -p /etc/membrane-os
[[ -s /etc/membrane-os/revision ]] || echo unknown > /etc/membrane-os/revision

# Make GTK/Pango fonts available immediately on the first live boot.
fc-cache -f

mkdir -p /home/liveuser/.config
cp -a /etc/skel/. /home/liveuser/
chown -R liveuser:liveuser /home/liveuser
