{ pkgs, lib, colors, ... }: {
  home = {
    packages = with pkgs; [ wf-recorder wl-clipboard brightnessctl xdg-utils ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      DISABLE_QT5_COMPAT = "0";
      QT_QPA_PLATFORM = "wayland;xcb";
      GDK_BACKEND = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      QT_STYLE_OVERRIDE = "kvantum";
      MOZ_ENABLE_WAYLAND = "1";
      XDG_SESSION_TYPE = "wayland";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      XCURSOR_SIZE = "24";
    };
  };
  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    extraSessionCommands = ''
      export XDG_CURRENT_DESKTOP=sway;
    '';
    wrapperFeatures.gtk = true;
    config = {
      bindkeysToCode = true;
      window = {
        titlebar = false;
        border = 0;
      };
      input = {
        "type:keyboard" = {
          xkb_layout = "us,ru";
          xkb_options = "ctrl:nocaps,grp:alt_space_toggle";
          repeat_delay = "200";
          repeat_rate = "30";
        };
        "type:mouse" = {
          dwt = "disabled";
          accel_profile = "flat";
        };
        "type:touchpad" = {
          tap = "disabled";
          natural_scroll = "enabled";
          accel_profile = "adaptive";
          scroll_factor = "0.45";
          pointer_accel = "0.27";
        };
      };
      bars = [{
        position = "top";
        command = "${lib.getExe pkgs.waybar}";
      }];
      defaultWorkspace = "workspace 1";
      keybindings = let
        mod = "Mod4";
        concatAttrs = lib.fold (x: y: x // y) { };
        tagBinds = concatAttrs (map (i: {
          "${mod}+${toString i}" = "exec 'swaymsg workspace ${toString i}'";
          "${mod}+Shift+${toString i}" =
            "exec 'swaymsg move container to workspace ${toString i}'";
        }) (lib.range 0 9));
      in tagBinds // {
        "${mod}+o" = "exec ${lib.getExe pkgs.hyprpicker} -a -n";

        "${mod}+p" = ''
          exec ${lib.getExe pkgs.grim} -g "$(${
            lib.getExe pkgs.slurp
          } -b ${colors.mantle}80 -c 00000000)" -| wl-copy -t image/png'';
        "${mod}+Shift+p" =
          "exec ${lib.getExe pkgs.grim} -c - | wl-copy -t image/png";

        "${mod}+Alt+p" = ''
          exec ${lib.getExe pkgs.grim} -g "$(${
            lib.getExe pkgs.slurp
          } -b ${colors.mantle}80 -c 00000000)" ~/pictures/screenshots/$(date "+%Y%m%d"_"%Hh%Mm%Ss"_grim).png'';
        "${mod}+Shift+Alt+p" = ''
          exec ${
            lib.getExe pkgs.grim
          } -c ~/pictures/screenshots/$(date "+%Y%m%d"_"%Hh%Mm%Ss"_grim).png '';

        "${mod}+Return" = "exec wezterm";
        "${mod}+d" = "exec firefox";

        "XF86AudioMute" = "exec amixer sset Master toggle";
        "XF86AudioRaiseVolume" = "exec amixer sset Master 5%+";
        "XF86AudioLowerVolume" = "exec amixer sset Master 5%-";

        "${mod}+XF86AudioRaiseVolume" = "exec amixer sset Master 1%+";
        "${mod}+XF86AudioLowerVolume" = "exec amixer sset Master 1%-";

        "XF86AudioNext" = "exec ${lib.getExe pkgs.playerctl} next";
        "XF86AudioPrev" = "exec ${lib.getExe pkgs.playerctl} previous";
        "XF86AudioPlay" = "exec ${lib.getExe pkgs.playerctl} play-pause";

        "XF86MonBrightnessDown" = "exec ${lib.getExe pkgs.brightnessctl} s 5%-";
        "XF86MonBrightnessUp" = "exec ${lib.getExe pkgs.brightnessctl} s 5%+";

        "${mod}+XF86MonBrightnessDown" =
          "exec ${lib.getExe pkgs.brightnessctl} s 1%-";
        "${mod}+XF86MonBrightnessUp" =
          "exec ${lib.getExe pkgs.brightnessctl} s 1%+";

        "XF86LaunchA" = "exec ${
            lib.getExe pkgs.brightnessctl
          } --device='kbd_backlight' s 5%-";
        "XF86Search" = "exec ${
            lib.getExe pkgs.brightnessctl
          } --device='kbd_backlight' s 5%+";
        "${mod}+XF86LaunchA" = "exec ${
            lib.getExe pkgs.brightnessctl
          } --device='kbd_backlight' s 1%-";
        "${mod}+XF86Search" = "exec ${
            lib.getExe pkgs.brightnessctl
          } --device='kbd_backlight' s 1%+";

        "${mod}+q" = "kill";
        "${mod}+r" = ''mode "resize"'';
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        "${mod}+e" = "layout toggle split";
        "${mod}+f" = "fullscreen";
        "${mod}+space" = "floating toggle";
        "${mod}+Shift+s" = "sticky toggle";
        "${mod}+Shift+space" = "focus mode_toggle";
        "${mod}+a" = "focus parent";
        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+q" = "exit";
      };
      colors = let
        style = {
          background = "#${colors.base}";
          indicator = "#${colors.text}";
          border = "#${colors.crust}";
          text = "#${colors.text}";
          childBorder = "#${colors.crust}";
        };
      in {
        focused = style;
        focusedInactive = style;
        unfocused = style;
        urgent = style;
      };
      output = {
        "*".bg = "#${colors.mantle} solid_color";
        "eDP-1".scale = "1";
      };
    };
  };
}
