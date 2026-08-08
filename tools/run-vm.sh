#!/usr/bin/env bash
set -euo pipefail
iso="$(find out -maxdepth 1 -name '*.iso' -print -quit)"
[[ -n "$iso" ]] || { echo "Build the ISO first." >&2; exit 1; }
[[ -f gpt-os-test.qcow2 ]] || qemu-img create -f qcow2 gpt-os-test.qcow2 64G
qemu-system-x86_64 -enable-kvm -m 4096 -smp 4 -machine q35 \
  -device virtio-vga-gl -display gtk,gl=on -cdrom "$iso" -boot d \
  -drive file=gpt-os-test.qcow2,if=virtio,format=qcow2
