{ lib, pkgs, ... }: {
  imports = [ ./keyboard.nix ./settings.nix ];

  programs.fish.enable = true;
  system.activationScripts.postActivation.text = ''
    sudo chsh -s ${lib.getBin pkgs.fish}/bin/fish idm1try
  '';

  services.nix-daemon.enable = true;
  users.users.idm1try.home = "/Users/idm1try";

  system.stateVersion = 4;
}
