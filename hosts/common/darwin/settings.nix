{ ... }: {
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
