{ pkgs, ... }: {
  services.dunst = {
    enable = pkgs.stdenv.hostPlatform.isLinux;
    settings = {
      global = {
        follow = "mouse";
        width = 320;
        origin = "top-left";
        notification_limit = 2;
        offset = "20x20";
        icon_position = "off";
        line_height = "8";

        progress_bar_height = 7;
        progress_bar_frame_width = 0;

        padding = 18;
        horizontal_padding = 18;
        frame_width = 0;
        gap_size = 9;
        font = "CartographCF Nerd Font 12";
        format =
          "<span size='x-large' font_desc='CartographCF Nerd Font Heavy Italic 9' foreground='#cdd6f4'>%a</span>\\n%s%b";
        show_indicators = false;
        mouse_left_click = "do_action";
        mouse_middle_click = "close_all";
        mouse_right_click = "close_current";
        ellipsize = "end";
        markup = "full";
      };

      urgency_low = {
        timeout = 3;
        background = "#181825";
        foreground = "#cdd6f4";
        highlight = "#cba6f7";
      };
      urgency_normal = {
        timeout = 6;
        background = "#181825";
        foreground = "#cdd6f4";
        highlight = "#cba6f7";
      };
      urgency_critical = {
        timeout = 0;
        background = "#181825";
        foreground = "#cdd6f4";
        highlight = "#cba6f7";
      };
    };
  };
}
