#!/bin/sh
git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts
cd nerd-fonts
git sparse-checkout add patched-fonts/Hack
./install.sh Hack
cd ..
rm -r nerd-fonts
