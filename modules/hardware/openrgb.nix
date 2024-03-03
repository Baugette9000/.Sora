{ config, lib, pkgs, libx11, stdenv, ... }:
{
  services.hardware.openrgb = {
    enable = true;

    };

}
