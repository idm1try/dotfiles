{ ... }: {
  programs.git = {
    enable = true;
    userName = "idm1try";
    userEmail = "dimasavchenko1706@icloud.com";
    extraConfig = {
      init.defaultBranch = "main";
      push.default = "current";
    };
  };
}
