#!/bin/sh

echo "Update fedora packages"
sudo dnf update

echo "Update flatpaks"
flatpak update

echo "Update PIPX"
pipx upgrade-all

echo "Update Rustup"
rustup update

echo "Update Cargo Binaries"
cargo install $(cargo install --list | egrep '^[a-z0-9_-]+ v[0-9.]+:$' | cut -f1 -d' ' | grep -v 'cargo-edit' )
# cargo install cargo-edit --features vendored-openssl
