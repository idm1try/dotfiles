{ pkgs, ... }: {
  imports = [
    ./sound.nix
    ./console.nix
    ./networking.nix
    ./users.nix
    ./locale.nix
    ./environment.nix
  ];

  services = {
    upower.enable = true;
    fstrim.enable = true;
    timesyncd.enable = true;
  };

  boot.loader.systemd-boot.enable = true;

  zramSwap.enable = true;

  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
