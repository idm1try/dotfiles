{ inputs, colors, ... }: {
  imports = [
    ./console.nix
    ./networking.nix
    ./users.nix
    ./locale.nix
    ./environment.nix
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

  security.pam.services.swaylock = { };

  services = {
    upower.enable = true;
    fstrim.enable = true;
    timesyncd.enable = true;
    udisks2.enable = true;
  };

  boot.loader = {
    systemd-boot.enable = true;
    timeout = 2;
  };

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  programs.dconf.enable = true;
}
