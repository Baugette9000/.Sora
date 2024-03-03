{ pkgs, ... }:
{
  gtk = {
    enable = true;
    font = {
      name = "Cascadia Code 10";
      };
    theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
      };
    iconTheme = {
      name = "oomox-gruvbox-dark";
      package = pkgs.gruvbox-dark-icons-gtk;
      };
    cursorTheme = {
      name = "oomox-gruvbox-dark";
      package = pkgs.whitesur-cursors;
      };
    gtk3.extraConfig = {
      Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };
    gtk4.extraConfig = {
      Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };
    };
  qt = {
    enable = true; 
    style.name = "gruvbox-dark";
    platformTheme = "gtk";
    };
    home.sessionVariables.GTK_THEME = "gruvbox-dark";
}

