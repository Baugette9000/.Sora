{ config, lib, pkgs, libx11, stdenv, ... }:

{
  boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  boot.initrd.kernelModules = [ "nvidia" ];
  services.xserver.videoDrivers = ["nvidia"];

      hardware.opengl = {  
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
      };
  
    
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable; 
    };

    services.xserver = {
     config = ''
      Section "Device"
      Identifier "nvidia"
      Driver "nvidia"
      BusID "PCI:0b:00:0"
      Option "AllowEmptyInitialConfiguration"
      EndSection
    '';
     screenSection = ''
      Option         "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
      Option         "AllowIndirectGLXProtocol" "off"
      Option         "TripleBuffer" "on"
    '';
    displayManager.setupCommands = ''
    ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-0 --auto --output DP-1 --right-of HDMI-0
    '';
    };
}
