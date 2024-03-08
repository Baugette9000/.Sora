{ config, pkgs, self, x11, inputs, ... }:

{
  imports = [
  
  ./config/dunst/dunst.nix
  ./config/gtk/gtk.nix
  ./config/pyprland/pyprland.nix

  ];


  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "cleo";
  home.homeDirectory = "/home/cleo";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    hello
    pokemon-colorscripts-mac
      xorg.libX11
      xorg.libX11.dev
      xorg.libxcb
      xorg.libXft
      xorg.libXinerama
      xorg.xinit
      xorg.xinput
  ];

  services.spotifyd = {
    enable = true;  
  };

  home.file = {
  ".config/hypr/hyprland.conf".source = .././window-manager/hypr.conf;
  ".bashrc".source = ./pkgs/bash/.bashrc; 
  ".config/kitty/kitty.conf".source = ./pkgs/kitty/kitty.conf;
  ".config/waybar/style.css".source = ./pkgs/waybar/style.css;
  ".config/waybar/config.jsonc".source = ./pkgs/waybar/config.jsonc;
  ".config/rofi/config.rasi".source = ./pkgs/rofi/config.rasi;
  #".config/rofi/config.rasi".source = .././rofi/config.rasi;
  # Nvim 
  ".config/nvim/init.lua".source = ./pkgs/nvim/init.lua;
  ".config/nvim/lazy-lock.json".source = ./pkgs/nvim/lazy-lock.json;
  ".config/nvim/lua/core/bootstrap.lua".source = ./pkgs/nvim/lua/core/bootstrap.lua;
  ".config/nvim/lua/core/default_config.lua".source = ./pkgs/nvim/lua/core/default_config.lua;
  ".config/nvim/lua/core/init.lua".source = ./pkgs/nvim/lua/core/init.lua;
  ".config/nvim/lua/core/mappings.lua".source = ./pkgs/nvim/lua/core/mappings.lua;
  ".config/nvim/lua/core/utils.lua".source = ./pkgs/nvim/lua/core/utils.lua;
  ".config/nvim/lua/custom/chadrc.lua".source = ./pkgs/nvim/lua/custom/chadrc.lua;
  ".config/nvim/lua/plugins/init.lua".source = ./pkgs/nvim/lua/plugins/init.lua;
  ".config/nvim/lua/plugins/configs/cmp.lua".source = ./pkgs/nvim/lua/plugins/configs/cmp.lua;
  ".config/nvim/lua/plugins/configs/mason.lua".source = ./pkgs/nvim/lua/plugins/configs/mason.lua;
  ".config/nvim/lua/plugins/configs/lspconfig.lua".source = ./pkgs/nvim/lua/plugins/configs/lspconfig.lua;
  ".config/nvim/lua/plugins/configs/nvimtree.lua".source = ./pkgs/nvim/lua/plugins/configs/nvimtree.lua;
  ".config/nvim/lua/plugins/configs/telescope.lua".source = ./pkgs/nvim/lua/plugins/configs/telescope.lua;
  ".config/nvim/lua/plugins/configs/lazy_nvim.lua".source = ./pkgs/nvim/lua/plugins/configs/lazy_nvim.lua;
  ".config/nvim/lua/plugins/configs/others.lua".source = ./pkgs/nvim/lua/plugins/configs/others.lua;
  ".config/nvim/lua/plugins/configs/treesitter.lua".source = ./pkgs/nvim/lua/plugins/configs/treesitter.lua;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/cleo/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
