#!/usr/bin/env bash
iso_name="gpt-os"
iso_label="GPT_OS_CAPTAIN_$(date +%Y%m)"
iso_publisher="GPT_OS Project"
iso_application="GPT_OS Captain Live/Recovery"
iso_version="0.1.0-dev"
install_dir="gptos"
buildmodes=('iso')
bootmodes=('uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.uki')
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
)
