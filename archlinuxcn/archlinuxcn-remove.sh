#!/usr/bin/env bash
set -e
echo "[+] Removing archlinuxcn..."
sudo sed -i '/^\[archlinuxcn\]/,+1d' /etc/pacman.conf
sudo pacman -Rns --noconfirm archlinuxcn-keyring || true
echo
echo "[+] archlinuxcn removed."
