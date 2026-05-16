#!/usr/bin/env bash

set -e

echo "[+] Removing archlinuxcn repository..."

sudo sed -i '/^\[archlinuxcn\]/,+1d' /etc/pacman.conf

sudo pacman -Rns --noconfirm archlinuxcn-keyring || true

sudo pacman -Sy

echo
echo "[+] archlinuxcn removed."
