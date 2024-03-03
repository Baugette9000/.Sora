{ config, lib, pkgs, libx11, stdenv, ... }:
{

hardware = {
  opentabletdriver.enable = true;
  opentabletdriver.daemon.enable = true; 
  };
}
