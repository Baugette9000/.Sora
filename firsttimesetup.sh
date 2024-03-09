#!/bin/sh

echo "Moving Hardware Configuration from the Host..."
echo "     "

sudo cp -r /etc/nixos/hardware-configuration.nix ~/.Sora/modules/hardware/hardware-configuration.nix

echo "Installing Home-Manager..."
echo "     "

nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
echo "     "
echo "Updating Nix-Channel.."
nix-channel --update 

echo "     "
echo "Please Log out and run "nix-shell '<home-manager>' -A install""
echo "     "
echo "After Running the command, Run makesystem.sh to continue"
