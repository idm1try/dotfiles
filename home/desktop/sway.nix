{ pkgs, lib, colors, ... }:
lib.mkIf pkgs.stdenv.isLinux {
  home = {
    packages = with pkgs; [ grim wf-recorder wl-clipboard slurp ];
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
      window = {
        titlebar = false;
        border = 0;
      };
      input = {
        "type:keyboard" = {
          xkb_layout = "us";
          xkb_options = "caps:escape";
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
      bars = lib.mkForce [ ];
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
        "${mod}+o" = "exec ${pkgs.hyprpicker}/bin/hyprpicker -a -n";
        "${mod}+p" = "exec ${pkgs.screenshot}/bin/screenshot";
        "${mod}+Shift+p" = "exec ${pkgs.fullscreenshot}/bin/fullscreenshot";
        "${mod}+n" = "exec ${pkgs.notifystatus}/bin/notifystatus";

        "${mod}+Return" = "exec wezterm";
        "${mod}+d" = "exec luakit";

        "XF86LaunchA" = "exec ${pkgs.kbdbrightness}/bin/kbdbrightness set 5%-";
        "XF86Search" = "exec ${pkgs.kbdbrightness}/bin/kbdbrightness set 5%+";

        "XF86AudioMute" = "exec ${pkgs.volume}/bin/volume sset Master toggle";
        "XF86AudioRaiseVolume" =
          "exec ${pkgs.volume}/bin/volume sset Master 5%+";
        "XF86AudioLowerVolume" =
          "exec ${pkgs.volume}/bin/volume sset Master 5%-";

        "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
        "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
        "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";

        "XF86MonBrightnessDown" =
          "exec ${pkgs.brightness}/bin/brightness set 5%-";
        "XF86MonBrightnessUp" =
          "exec ${pkgs.brightness}/bin/brightness set 5%+";

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
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";
        "${mod}+f" = "fullscreen";
        "${mod}+space" = "floating toggle";
        "${mod}+Shift+s" = "sticky toggle";
        "${mod}+Shift+space" = "focus mode_toggle";
        "${mod}+a" = "focus parent";
        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+q" = "exit";
      };
      colors = {
        focused = {
          background = colors.base;
          indicator = colors.text;
          border = colors.crust;
          text = colors.text;
          childBorder = colors.crust;
        };
        focusedInactive = {
          background = colors.base;
          indicator = colors.text;
          border = colors.crust;
          text = colors.text;
          childBorder = colors.crust;
        };
        unfocused = {
          background = colors.base;
          indicator = colors.text;
          border = colors.crust;
          text = colors.text;
          childBorder = colors.crust;
        };
        urgent = {
          background = colors.base;
          indicator = colors.text;
          border = colors.crust;
          text = colors.text;
          childBorder = colors.crust;
        };
      };
      output = {
        "*".bg = "${colors.mantle} solid_color";
        "eDP-1".scale = "1";
      };
    };
  };
}
