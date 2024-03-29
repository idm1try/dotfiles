{ inputs, colors, ... }: {
  imports = [
    ./console.nix
    ./networking.nix
    ./users.nix
    ./locale.nix
    ./environment.nix
  ];

  nixpkgs.overlays = with inputs; [ nur.overlay neovim-nightly.overlay ];
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
      substituters =
        [ "https://nix-community.cachix.org" "https://ceon.cachix.org" ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "ceon.cachix.org-1:xdD8jN8QNCi0QMvL+3N7YxEbrAtf6rzClqTAaeYFl64="
      ];
      tarball-ttl = 604800;
    };
  };

  sound.enable = true;

  services = {
    upower.enable = true;
    fstrim.enable = true;
    timesyncd.enable = true;
    udisks2.enable = true;
  };

  boot.loader.systemd-boot.enable = true;

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  programs.dconf.enable = true;
}
