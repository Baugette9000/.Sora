{ config, lib, pkgs, libx11, stdenv, ... }:

{

      services.dunst = {
      enable = true;
      settings = {
        global = {
          monitor = 0; 
          height = 200;
          width = 300;
          follow = "mouse";
          scale = 1;
          notification_limit = 0;
          offset = "48x80";
          indicate_hidden = "yes";
          shrink = "yes";
          separator_height = 0;
          progress_bar = true;
          progress_bar_height = 80;
          progress_bar_frame_width = 4;
          progress_bar_min_width = 300;
          progress_bar_max_width = 300;
          padding = 15;
          separator_color = "frame";
          horizontal_padding = 15;
          text_icon_padding = 10;
          frame_width = 3;
          gap_size = 0;
          sort = "yes";
          idle_threshold = 120;
          ellipsize = "middle";
          vertical_alignment = "center";
          font = "Cascadia Code Italic Bold 10";
          line_height = 4;
          markup = "full";
          format = "<b>%s</b>\n%b";
          alignment = "left"; 
          show_age_threshold = 60;
          word_wrap = "yes";
          ignore_newline = "no";
          stack_duplicates = false;
          hide_duplicate_count = "yes";
          show_indicators = "no";
          icon_position = "left";
          icon_theme = "Adwaita-dark";
          sticky_history = "yes";
          history_length = 20;
          history = "ctrl+grave";
          browser = "floorp";
          always_run_script = true;
          title = "Dunst";
          class = "Dunst";
          max_icon_size = 64; 
          background = "#282828";
          foreground = "#ebdbb2";
          frame_color = "#d3869b";
          timeout = 4;
        };
      };
    };

}
