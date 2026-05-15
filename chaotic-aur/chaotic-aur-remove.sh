#!/usr/bin/env bash
set -e
echo "[+] Removing Chaotic-AUR..."
sudo sed -i '/^\[chaotic-aur\]/,+1d' /etc/pacman.conf
sudo pacman -Rns --noconfirm \
    chaotic-keyring \
    chaotic-mirrorlist || true
echo
echo "[+] Chaotic-AUR removed."
