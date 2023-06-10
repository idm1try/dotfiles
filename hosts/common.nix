{ pkgs, inputs, ... }:
let
  colors = {
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
