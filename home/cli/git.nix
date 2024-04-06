{ ... }: {
  programs.git = {
    enable = true;
    userName = "idm1try";
    userEmail = "dimasavchenko1706@icloud.com";
    extraConfig = {
      github.user = "idm1try";
      init.defaultBranch = "main";
      difftool.prompt = false;
      mergetool = {
        keepBackup = false;
        trustExitCode = false;
        prompt = true;
      };
      diff = {
        tool = "vimdiff";
        guitool = "vimdiff";
      };
      merge = {
        tool = "vimdiff";
        conflictstyle = "diff3";
      };
      push = {
        default = "current";
        autoSetupRemote = true;
      };
      alias = {
        a = "add";
        aa = "add --all";
        d = "diff";
        co = "checkout";
        cm = "commit";
        ca = "commit -a";
        ps = "push";
        pl = "pull";
        st = "status";
        br = "branch";
        ba = "branch -a";
        bm = "branch --merged";
        bn = "branch --no-merged";
        lg =
          "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        type = "cat-file -t";
        dump = "cat-file -p";
        edit-unmerged =
          "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; vim `f`";
        add-unmerged =
          "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; git add `f`";
      };
    };
  };
}
