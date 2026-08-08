#!/usr/bin/env bash
set -euo pipefail
if [[ $EUID -ne 0 ]]; then
  echo "Run with sudo: sudo ./build.sh" >&2
  exit 1
fi
command -v mkarchiso >/dev/null || { echo "Install archiso first." >&2; exit 1; }
rm -rf work
mkarchiso -v -w work -o out .
