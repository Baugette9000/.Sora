# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, libx11, stdenv, inputs, ... }:

{
  # Add Imports 
  imports =
    [       
      ../hardware/hardware-configuration.nix
      ../hardware/opentabletdriver.nix
      ../hardware/nvidia.nix
      ../hardware/openrgb.nix
      ../hardware/garbagecollector.nix
      ../pkgs/steam/steam.nix
      ../window-manager/hyprland
      ../window-manager/wayland

    ];

  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true; 
    devices = [ "nodev" ];
    efiSupport = true;
    useOSProber = true;
    };

  # Windows Dualboot Settings 
    time.hardwareClockInLocalTime = true;

    # X11.
    services.xserver = {
    enable = true;
    # Enable Desktop Enviornments.
    desktopManager = {
      #xfce.enable = true;
      plasma5.enable = true;
      #gnome.enable = true;
      #lxde.enable = true;
      };
      displayManager = {
        sddm = { 
          enable = true;
#          theme = "${import ../pkgs/sddm/sddm.nix { inherit pkgs; }}";
        };
        #lightdm.enable = true;
        #gdm.enable = true; 
      };
    };
 
  # getting flatpak to work without plasma
    services.flatpak = {
      enable = true;
    };
    
    xdg = { 
      portal = { 
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; 
        enable = true; 
      };
    };
  #services.xserver.desktopManager.cde.enable = true;
  environment.etc = {
    "xdg/gtk-2.0/gtkrc".text = "gtk-error-bell=0";
    "xdg/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-theme-name="gruvbox-dark"
      gtk-icon-name="oomox-gruvbox-dark"
    '';
    "xdg/gtk-4.0/settings.ini".text = ''
      [Settings]
      gtk-theme-name="gruvbox-dark"
      gtk-icon-name="oomox-gruvbox-dark"
    '';
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  nix.optimise.automatic = true;
  nix.optimise.dates = [ "03:45" ]; # Optional; allows customizing optimisation schedu
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cleo = {
    isNormalUser = true;
    description = "cleo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      floorp
      kate
      xorg.libX11
      xorg.libX11.dev
      xorg.libxcb
      xorg.libXft
      xorg.libXinerama
      xorg.xinit
      xorg.xinput
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true; 
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    font-awesome_5
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts  
    cascadia-code
  ];


  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    meson 
    ninja
    cmake
    devour
    pkg-config
    libnotify
    dwmblocks
    polybar
    i3ipc-glib
    i3lock-color
    betterlockscreen
    floorp
  # firefox
    spicetify-cli
    spotify
    wpgtk
    nwg-look
    gtk-engine-murrine
    qt6Packages.qtstyleplugin-kvantum
    qt5.qtquickcontrols2   
    qt5.qtgraphicaleffects
    zoom-us
    vesktop
    spotifyd
    ncspot
    spotify-tui
    git
    pciutils
    uutils-coreutils-noprefix
    #coreutils-full
    toybox
    #python311Packages.uptime
    pavucontrol
    htop
    tree
    kitty
    rofi 
    dmenu
    xfce.thunar
    neovim
    ranger
    dunst
    mpd
    acpi
    cbonsai
    cmatrix  
    pipes
    scrot
    acpi
    slstatus
    unixtools.top
    st 
    feh 
    flatpak
    neofetch
    gnumake
    python3
    rustup
    rustc
    libsForQt5.bismuth
    libsForQt5.gwenview
    gparted 
    playerctl
    gccgo12
    gccgo13
    gccgo
    gcc9
    gcc_multi
    opentabletdriver
    krita
    xorg.libX11
    xorg.libX11.dev
    xorg.libxcb
    xorg.libXft
    xorg.libXinerama
    xorg.xinit
    xorg.xinput
    maim
    xclip
    openrgb
    unclutter
    redshift
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
