{ ... }: {
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        showIcons = true;
        showBottomLine = false;
        theme = {
          activeBorderColor = [ "blue" "bold" ];
          inactiveBorderColor = [ "black" ];
          optionsTextColor = [ "blue" ];
          selectedLineBgColor = [ "black" "bold" ];
          selectedRangeBgColor = [ "black" "bold" ];
          cherryPickedCommitBgColor = [ "cyan" ];
          cherryPickedCommitFgColor = [ "blue" ];
          unstagedChangesColor = [ "red" ];
        };
      };
    };
  };
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
