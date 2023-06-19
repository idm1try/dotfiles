{ pkgs, inputs, colors, ... }: {
  nixpkgs = {
    config.allowUnfree = true;
    overlays = with inputs; [
      neovim-overlay.overlay
      nur.overlay
      (final: prev: {
        wezterm-git =
          prev.darwin.apple_sdk_11_0.callPackage ../../overlays/wezterm.nix {
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
    users.idm1try.imports = [ ../../home ];
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
