#!/bin/sh

home-manager switch --flake ~/.Sora

echo "                                 "
echo "Successfully Built Home Directory" 
echo "                                 "
sudo nixos-rebuild switch --flake ~/.Sora

echo "         "
echo "Successfully Built the NixOS System Configuration"
echo "         "
echo "Finished!"
