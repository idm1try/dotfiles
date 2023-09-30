{ colors, ... }: {
  programs.waybar = {
    enable = true;
    settings = [{
      bar_id = "bar-0";
      ipc = true;
      layer = "top";
      position = "top";
      height = 68;
      modules-left = [ "sway/workspaces" ];
      modules-center = [ ];
      modules-right = [
        "network"
        "sway/language"
        "wireplumber"
        "backlight"
        "battery"
        "clock"
      ];
      "sway/workspaces" = {
        disable-scroll = true;
        disable-click = true;
        format = "{name}";
        persistent_workspaces = {
          "1" = [ ];
          "2" = [ ];
          "3" = [ ];
          "4" = [ ];
          "5" = [ ];
          "6" = [ ];
          "7" = [ ];
          "8" = [ ];
          "9" = [ ];
        };
      };
      clock = {
        format =
          "<span font_desc='CartographCF Nerd Font Heavy Italic' color='#${colors.mauve}' text_transform='lowercase'>{:%A, %d %B %H:%M}</span>";
      };
      battery = {
        format =
          "<span font_desc='CartographCF Nerd Font Heavy Italic' color='#${colors.mauve}'>bat</span> {capacity}%";
        format-charging =
          "<span font_desc='CartographCF Nerd Font Heavy Italic' color='#${colors.mauve}'>bat [ac]</span> {capacity}%";
        interval = 5;
        tooltip = false;
      };
      wireplumber = {
        format =
          "<span font_desc='CartographCF Nerd Font Heavy Italic' color='#${colors.mauve}'>vol</span> {volume}%";
        format-muted =
          "<span font_desc='CartographCF Nerd Font Heavy Italic' color='#${colors.mauve}'>vol</span> muted";
        tooltip = false;
      };
      backlight = {
        format =
          "<span font_desc='CartographCF Nerd Font Heavy Italic' color='#${colors.mauve}'>bri</span> {percent}%";
      };
      "sway/language" = {
        format =
          "<span font_desc='CartographCF Nerd Font Heavy Italic' color='#${colors.mauve}'>{}</span>";
        tooltip = false;
      };
      network = {
        tooltip = false;
        format = "";
        format-disconnected =
          "<span font_desc='CartographCF Nerd Font Heavy' color='#${colors.red}'>!</span>";
        interval = 5;
      };
      spacing = 30;
    }];
    style = ''
      window#waybar {
        font-family: CartographCF Nerd Font;
        font-size: 16px;
        background-color: #${colors.mantle};
        border-radius: 0px;
        color: #${colors.overlay0};
      }

      #workspaces {
        margin-left: 30px;
      }

      #clock {
        margin-right: 30px;
      }

      #workspaces button {
        padding: 0 5px;
        color: #${colors.overlay0};
        background-color: #${colors.mantle};
      }

      #workspaces button.focused {
        color: #${colors.mauve};
        font-weight: 900;
        background-color: #${colors.mantle};
      }
    '';
  };
}
