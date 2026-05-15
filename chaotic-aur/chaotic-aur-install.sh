#!/usr/bin/env bash
set -e
echo "[+] Setting up Chaotic-AUR..."
sudo pacman-key --recv-key 3056513887B78AEB \
    --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U --noconfirm \
    https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst \
    https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst
if ! grep -q "^\[chaotic-aur\]" /etc/pacman.conf; then
    echo "" | sudo tee -a /etc/pacman.conf >/dev/null
    echo "[chaotic-aur]" | sudo tee -a /etc/pacman.conf >/dev/null
    echo "Include = /etc/pacman.d/chaotic-mirrorlist" \
        | sudo tee -a /etc/pacman.conf >/dev/null
fi
sudo pacman -Sy
echo
echo "[+] Chaotic-AUR repository installed successfully."
