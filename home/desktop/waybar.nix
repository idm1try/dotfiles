{ colors, ... }: {
  programs.waybar = {
    enable = true;
    settings = [{
      bar_id = "bar-0";
      ipc = true;
      layer = "top";
      position = "top";
      height = 64;
      modules-left = [ "sway/workspaces" ];
      modules-center = [ ];
      modules-right = [ "sway/language" "memory" "cpu" "battery" "clock" ];
      "sway/workspaces" = {
        disable-scroll = true;
        disable-click = true;
        format = "{name}";
      };
      "clock" = {
        format =
          "<span font_desc='CartographCF Nerd Font Heavy Italic' color='#${colors.mauve}' text_transform='lowercase'>{:%A, %d %B %H:%M}</span>";
      };
      "battery" = {
        format =
          "<span font_desc='CartographCF Nerd Font Heavy Italic' color='#${colors.mauve}'>bat</span> {capacity}%";
        format-charging =
          "<span font_desc='CartographCF Nerd Font Heavy Italic' color='#${colors.mauve}'>bat [ac]</span> {capacity}%";
        interval = 5;
        tooltip = false;
      };
      "cpu" = {
        format =
          "<span font_desc='CartographCF Nerd Font Heavy Italic' color='#${colors.mauve}'>cpu</span> {usage}%";
        interval = 5;
        tooltip = false;
      };
      "memory" = {
        format =
          "<span font_desc='CartographCF Nerd Font Heavy Italic' color='#${colors.mauve}'>ram</span> {used}gb";
        interval = 5;
        tooltip = false;
      };
      "sway/language" = {
        format =
          "<span font_desc='CartographCF Nerd Font Heavy Italic' color='#${colors.mauve}'>{}</span>";
        tooltip = false;
      };
      spacing = 30;
    }];
    style = ''
      window#waybar {
        font-family: CartographCF Nerd Font;
        font-size: 16px;
        background-color: #${colors.crust};
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
        padding: 0 10px;
        color: #${colors.overlay0};
        background-color: #${colors.crust};
      }

      #workspaces button.focused {
        color: #${colors.mauve};
        font-weight: 900;
        background-color: #${colors.crust};
      }
    '';
  };
}
