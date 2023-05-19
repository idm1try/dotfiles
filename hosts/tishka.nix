{ pkgs, lib, ... }: {
  programs.fish.enable = true;
  system.activationScripts.postActivation.text = ''
    sudo chsh -s ${lib.getBin pkgs.fish}/bin/fish idm1try
  '';

  services.nix-daemon.enable = true;
  security.pam.enableSudoTouchIdAuth = true;

  networking = {
    hostName = "tishka";
    computerName = "tishka";
    localHostName = "tishka";
  };
  system.stateVersion = 4;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
    nonUS.remapTilde = true;
  };

  system.defaults = {
    screencapture = { location = "/tmp"; };
    dock = {
      showhidden = true;
      mru-spaces = false;
      minimize-to-application = true;
      show-recents = false;
      tilesize = 30;
      autohide = true;
    };
    finder = {
      AppleShowAllFiles = true;
      ShowPathbar = true;
      FXDefaultSearchScope = "SCcf";
      CreateDesktop = false;
      AppleShowAllExtensions = true;
      QuitMenuItem = true;
      FXEnableExtensionChangeWarning = false;
    };
    NSGlobalDomain = {
      NSDocumentSaveNewDocumentsToCloud = false;
      NSTableViewDefaultSizeMode = 1;
      AppleKeyboardUIMode = 3;
      _HIHideMenuBar = true;
      InitialKeyRepeat = 10;
      KeyRepeat = 2;
    };
  };
}
