{ ... }:
{

  programs = {
    hyprland = {
      enable = true;
      nvidiaPatches = true; 
      xwayland = {
        hidpi = true;
        enable = true;
        };
      };
      waybar = {
        enable = true;
        package = pkgs.waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
          });
        };
    };

    environment.systemPackages = with pkgs; [
      grim
      slurp
      swww
      xdg-desktop-portal-wayland
      xdg-utils
      xdg-desktop-portal 
      xdg-desktop-portal-gtk
      qt5.qtwayland
      qt6.qtmake
      qt6.qtwayland
      wofi
    ];

    environment.sessionVariables = {
    POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    CLUTTER_BACKEND = "wayland";
    WLR_RENDERER = "vulkan";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GTK_USE_PORTAL = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    };
  
    xdg = { 
      portal = {
        enable = true;
        extraPortals = [ 
          pkgs.xdg-desktop-portal-gtk 
          pkgs.xdg-desktop-portal
        ]; 
      };
    };
}
