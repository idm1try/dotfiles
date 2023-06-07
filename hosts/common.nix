{ pkgs, inputs, ... }:
let
  themes = {
    carbon = {
      light = {
        rosewater = "#da1e28";
        flamingo = "#da1e28";
        red = "#da1e28";
        maroon = "#da1e28";
        pink = "#d02670";
        mauve = "#8a3ffc";
        peach = "#d44a1c";
        yellow = "#ab8600";
        green = "#007d79";
        teal = "#1192e8";
        sky = "#1192e8";
        sapphire = "#1192e8";
        blue = "#0f62fe";
        lavender = "#0f62fe";
        text = "#000000";
        subtext1 = "#404040";
        subtext0 = "#474747";
        overlay2 = "#575757";
        overlay1 = "#595959";
        overlay0 = "#737373";
        surface2 = "#8c8c8c";
        surface1 = "#d1d1d1";
        surface0 = "#e6e6e6";
        base = "#FFFFFF";
        mantle = "#f2f2f2";
        crust = "#ebebeb";
      };
      dark = {
        rosewater = "#ff8389";
        flamingo = "#ff8389";
        red = "#ff8389";
        maroon = "#ff8389";
        pink = "#ff7eb6";
        mauve = "#be95ff";
        peach = "#d44a1c";
        yellow = "#ab8600";
        green = "#08bdba";
        teal = "#33b1ff";
        sky = "#33b1ff";
        sapphire = "#33b1ff";
        blue = "#78a9ff";
        lavender = "#78a9ff";
        text = "#ffffff";
        subtext1 = "#f4f4f4";
        subtext0 = "#e0e0e0";
        overlay2 = "#adadad";
        overlay1 = "#949494";
        overlay0 = "#7a7a7a";
        surface2 = "#4f4f4f";
        surface1 = "#383838";
        surface0 = "#2e2e2e";
        base = "#161616";
        mantle = "#0d0d0d";
        crust = "#000000";
      };
    };
    gruvbox_material = {
      light = {
        rosewater = "#c14a4a";
        flamingo = "#c14a4a";
        pink = "#945e80";
        mauve = "#945e80";
        red = "#c14a4a";
        maroon = "#c14a4a";
        peach = "#c35e0a";
        yellow = "#a96b2c";
        green = "#6c782e";
        teal = "#4c7a5d";
        sky = "#4c7a5d";
        sapphire = "#4c7a5d";
        blue = "#45707a";
        lavender = "#45707a";
        text = "#654735";
        subtext1 = "#7b5d44";
        subtext0 = "#8f6f56";
        overlay2 = "#a28368";
        overlay1 = "#b6977a";
        overlay0 = "#c9aa8c";
        surface2 = "#A79C86";
        surface1 = "#C9C19F";
        surface0 = "#DFD6B1";
        base = "#fbf1c7";
        mantle = "#F3EAC1";
        crust = "#E7DEB7";
      };
      dark = {
        rosewater = "#EA6962";
        flamingo = "#EA6962";
        pink = "#D3869B";
        mauve = "#D3869B";
        red = "#EA6962";
        maroon = "#EA6962";
        peach = "#BD6F3E";
        yellow = "#D8A657";
        green = "#A9B665";
        teal = "#89B482";
        sky = "#89B482";
        sapphire = "#89B482";
        blue = "#7DAEA3";
        lavender = "#7DAEA3";
        text = "#D4BE98";
        subtext1 = "#BDAE8B";
        subtext0 = "#A69372";
        overlay2 = "#5A5E60";
        overlay1 = "#55595B";
        overlay0 = "#5F6365";
        surface2 = "#4B4F51";
        surface1 = "#3c3f40";
        surface0 = "#2d2f30";
        base = "#1D2021";
        mantle = "#191C1D";
        crust = "#151819";
      };
    };
    catppuccin = {
      light = {
        rosewater = "#dc8a78";
        flamingo = "#DD7878";
        pink = "#ea76cb";
        mauve = "#8839EF";
        red = "#D20F39";
        maroon = "#E64553";
        peach = "#FE640B";
        yellow = "#df8e1d";
        green = "#40A02B";
        teal = "#179299";
        sky = "#04A5E5";
        sapphire = "#209FB5";
        blue = "#1e66f5";
        lavender = "#7287FD";
        text = "#4C4F69";
        subtext1 = "#5C5F77";
        subtext0 = "#6C6F85";
        overlay2 = "#7C7F93";
        overlay1 = "#8C8FA1";
        overlay0 = "#9CA0B0";
        surface2 = "#ACB0BE";
        surface1 = "#BCC0CC";
        surface0 = "#CCD0DA";
        base = "#EFF1F5";
        mantle = "#E6E9EF";
        crust = "#DCE0E8";
      };
      dark = {
        rosewater = "#F5E0DC";
        flamingo = "#F2CDCD";
        pink = "#F5C2E7";
        mauve = "#CBA6F7";
        red = "#F38BA8";
        maroon = "#EBA0AC";
        peach = "#FAB387";
        yellow = "#F9E2AF";
        green = "#A6E3A1";
        teal = "#94E2D5";
        sky = "#89DCEB";
        sapphire = "#74C7EC";
        blue = "#89B4FA";
        lavender = "#B4BEFE";
        text = "#CDD6F4";
        subtext1 = "#BAC2DE";
        subtext0 = "#A6ADC8";
        overlay2 = "#9399B2";
        overlay1 = "#7F849C";
        overlay0 = "#6C7086";
        surface2 = "#585B70";
        surface1 = "#45475A";
        surface0 = "#313244";
        base = "#1E1E2E";
        mantle = "#181825";
        crust = "#11111B";
      };
    };
  };
  colors = themes.gruvbox_material.light;
in {
  nixpkgs = {
    config.allowUnfree = true;
    overlays = with inputs; [
      neovim-overlay.overlay
      nur.overlay
      (final: prev: {
        wezterm-git =
          prev.darwin.apple_sdk_11_0.callPackage ../overlays/wezterm.nix {
            inherit (prev.darwin.apple_sdk_11_0.frameworks)
              Cocoa CoreGraphics Foundation UserNotifications;

            src = inputs.wezterm-src;
            crane-lib = crane.lib."${prev.system}";
          };
      })
    ];
  };
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs colors; };
    users.idm1try.imports = [ ../home ];
  };
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      warn-dirty = false;
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      auto-optimise-store = pkgs.stdenv.isLinux;
      substituters = [ "https://nix-community.cachix.org" ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      tarball-ttl = 604800;
    };
  };
}
