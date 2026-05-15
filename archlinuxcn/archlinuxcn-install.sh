#!/usr/bin/env bash
set -e
echo "[+] Setting up archlinuxcn..."
sudo pacman-key --init
sudo pacman-key --recv-keys 3056513887B78AEB \
    --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
if ! grep -q "^\[archlinuxcn\]" /etc/pacman.conf; then
    echo "" | sudo tee -a /etc/pacman.conf >/dev/null
    echo "[archlinuxcn]" | sudo tee -a /etc/pacman.conf >/dev/null
    echo "Server = https://repo.archlinuxcn.org/\$arch" \
        | sudo tee -a /etc/pacman.conf >/dev/null
fi
sudo pacman -Sy --noconfirm archlinuxcn-keyring
echo
echo "[+] archlinuxcn repository installed successfully."
