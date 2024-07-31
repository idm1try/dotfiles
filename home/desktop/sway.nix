{ pkgs, lib, colors, ... }: {
  home = {
    packages = with pkgs; [ wf-recorder wl-clipboard xdg-utils ];
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
    package = pkgs.sway-unwrapped.override {
      enableXWayland = false;
      trayEnabled = false;
    };
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
          pointer_accel = "0.47";
        };
      };
      startup = [{
        command = ''
          ${lib.getExe pkgs.swayidle} -w \
            timeout 180 'swaylock -f' \
            before-sleep 'swaylock -f'
        '';
        always = true;
      }];
      bars = [{
        position = "top";
        command = "waybar";
      }];
      defaultWorkspace = "workspace 1";
      keybindings = let
        mod = "Mod4";
        concatAttrs = lib.fold (x: y: x // y) { };
        tagBinds = concatAttrs (map (i: {
          "${mod}+${toString i}" = "exec 'swaymsg workspace ${toString i}'";
          "${mod}+Shift+${toString i}" =
            "exec 'swaymsg move container to workspace ${toString i}'";
        }) (lib.range 1 9));
      in tagBinds // {
        "${mod}+o" = "exec ${lib.getExe pkgs.hyprpicker} -a -n";
        "${mod}+0" = "exec swaylock -f";

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
        "XF86AudioRaiseVolume" =
          "exec ${pkgs.alsa-utils}/bin/amixer sset Master 5%+";
        "XF86AudioLowerVolume" =
          "exec ${pkgs.alsa-utils}/bin/amixer sset Master 5%-";

        "${mod}+XF86AudioRaiseVolume" =
          "exec ${pkgs.alsa-utils}/bin/amixer sset Master 1%+";
        "${mod}+XF86AudioLowerVolume" =
          "exec ${pkgs.alsa-utils}/bin/amixer sset Master 1%-";

        "XF86AudioNext" = "exec ${lib.getExe pkgs.playerctl} next";
        "XF86AudioPrev" = "exec ${lib.getExe pkgs.playerctl} previous";
        "XF86AudioPlay" = "exec ${lib.getExe pkgs.playerctl} play-pause";

        "XF86MonBrightnessDown" = "exec ${lib.getExe pkgs.brightnessctl} s 5%-";
        "XF86MonBrightnessUp" = "exec ${lib.getExe pkgs.brightnessctl} s 5%+";

        "${mod}+XF86MonBrightnessDown" =
          "exec ${lib.getExe pkgs.brightnessctl} s 1%-";
        "${mod}+XF86MonBrightnessUp" =
          "exec ${lib.getExe pkgs.brightnessctl} s 1%+";

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
      seat = { "*".hide_cursor = "when-typing enable"; };
      output = {
        "*".bg = "#${colors.mantle} solid_color";
        "eDP-1".scale = "1";
      };
    };
    extraConfig = ''
      bindswitch lid:on exec sleep 4 && ${
        lib.getExe pkgs.ffmpeg_7-headless
      } -f v4l2 -s 640x480 -i /dev/video0 -ss 0:0:1 -frames 1 ~/pictures/shots/lid-$(date "+%Y%m%d"_"%Hh%Mm%Ss").jpg
    '';
  };
  programs.swaylock = {
    enable = true;
    settings = {
      no-unlock-indicator = true;
      ignore-empty-password = true;
      color = "${colors.crust}";
    };
  };
}
