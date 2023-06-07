{ pkgs, inputs, ... }:
let
  colors = {
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
