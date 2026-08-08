#!/usr/bin/env bash
iso_name="membrane-os-captain"
iso_label="MEMBRANE_CAPTAIN_$(date +%Y%m)"
iso_publisher="Membrane OS Project"
iso_application="Membrane OS Captain Live/Recovery"
iso_version="0.1.0-dev"
install_dir="membrane"
buildmodes=('iso')
bootmodes=('uefi.systemd-boot')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '15')
file_permissions=(
  ["/usr/bin/gpt-recovery"]="0:0:755"
  ["/usr/bin/gpt-welcome"]="0:0:755"
  ["/usr/lib/gpt-os/install-backend"]="0:0:755"
  ["/usr/local/bin/gpt-live-session"]="0:0:755"
  ["/root/customize_airootfs.sh"]="0:0:755"
  ["/usr/lib/membrane-os/check-update"]="0:0:755"
  ["/usr/lib/membrane-os/install-update"]="0:0:755"
)
