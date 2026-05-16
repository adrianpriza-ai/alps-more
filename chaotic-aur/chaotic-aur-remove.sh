#!/usr/bin/env bash

set -e

echo "[+] Removing Chaotic-AUR repository..."

sudo sed -i '/^\[chaotic-aur\]/,+1d' /etc/pacman.conf

sudo pacman -Rns --noconfirm \
    chaotic-keyring \
    chaotic-mirrorlist || true

sudo pacman -Sy

echo
echo "[+] Chaotic-AUR removed."
