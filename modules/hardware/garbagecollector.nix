{ config, lib, pkgs, libx11, stdenv, ... }:

{

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.extraOptions = ''
  min-free = ${toString (100 * 1024 * 1024)}
  max-free = ${toString (1024 * 1024 * 1024)}
  '';
}
