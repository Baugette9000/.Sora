#!/bin/sh

echo "Beginning Full System Upgrade"
echo "       "
echo "..."
echo "   "
sudo nix-channel --update 

echo "Updated Nix-Channel"
echo "       "
echo "..."
echo "   "
home-manager switch --flake ~/.Sora

echo "                                 "
echo "Built Home Directory" 
echo "                                 "
echo "..."
echo "   "
sudo nixos-rebuild switch --flake ~/.Sora

echo "         "
echo "Built the NixOS System Configuration"
echo "         "
