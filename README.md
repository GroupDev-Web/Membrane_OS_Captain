# GPT_OS Captain

GPT_OS Captain is an Arch Linux–based desktop distribution with a polished,
Mac-inspired desktop session named **GPT_DESKTOP**. The project builds a
bootable x86_64 live ISO with a graphical recovery environment, installer,
automatic live-session login, and first-boot setup assistant.

> Status: developer preview. Test installation in a VM before using physical
> hardware. The installer can erase the selected disk.

## Included experience

- GPT_DESKTOP Wayland session, built on KDE Plasma 6
- top panel, centered floating dock, blur, rounded window decorations
- GPT_OS Recovery with Disk Management, Terminal, Network, and installation
- guided installation with TOS, network check, disk selection, user, home name,
  computer name, timezone, and final confirmation
- automatic live desktop boot
- animated first-boot welcome and account confirmation
- SDDM graphical login after setup

## Build

### GitHub Actions (easiest)

Open the repository's **Actions** tab, select **Build GPT_OS Captain ISO**, and
choose **Run workflow**. When it finishes, download the
`GPT_OS-Captain-<run number>` artifact. It contains the bootable ISO and its
SHA-256 checksum.

The workflow also runs automatically after pushes to `main`.

### Build on Arch Linux

Use a current Arch Linux machine with at least 20 GiB free:

```bash
sudo pacman -S --needed archiso
sudo ./build.sh
```

The ISO is written to `out/`. Boot it using UEFI in GNOME Boxes, virt-manager,
or QEMU first. Internet access is required during installation.

## QEMU test

```bash
./tools/run-vm.sh
```

## Project layout

- `profiledef.sh`, `packages.x86_64`, `pacman.conf`: ArchISO profile
- `airootfs/usr/bin/gpt-recovery`: recovery and installer UI
- `airootfs/usr/lib/gpt-os/install-backend`: privileged installation backend
- `airootfs/usr/bin/gpt-welcome`: first-boot setup assistant
- `airootfs/etc/skel`: GPT_DESKTOP defaults
- `docs/ROADMAP.md`: path from developer preview to stable release

## Branding note

The interface is inspired by the clarity and spatial layout of macOS Recovery,
but uses original GPT_OS names, icons, colors, text, and assets. Apple logos and
proprietary artwork are intentionally not included.
