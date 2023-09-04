{ pkgs, inputs, colors, ... }: {
  imports = [
    ./sound.nix
    ./console.nix
    ./networking.nix
    ./users.nix
    ./locale.nix
    ./environment.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = with inputs; [
    nur.overlay
    (import ../../overlays/binscripts.nix)
    (final: prev: {
      phocus-oxocarbon =
        prev.callPackage ../../overlays/phocus-oxocarbon.nix { };
    })
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs colors; };
    users.idm1try.imports = [ ../../home ];
  };
  nix = {
    gc.automatic = true;
    settings = {
      warn-dirty = false;
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      auto-optimise-store = true;
      substituters = [ "https://nix-community.cachix.org" ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      tarball-ttl = 604800;
    };
  };

  services = {
    upower.enable = true;
    fstrim.enable = true;
    timesyncd.enable = true;
  };

  boot.loader.systemd-boot.enable = true;

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
