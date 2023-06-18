{ pkgs, ... }: {
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      nix_shell.symbol = " ";
      c.symbol = " ";
      directory = {
        style = "cyan bold italic";
        read_only = " ";
      };
      docker_context.symbol = " ";
      golang.symbol = " ";
      lua.symbol = " ";
      nodejs.symbol = " ";
      package.symbol = " ";
      rust.symbol = " ";
      git_branch = {
        symbol = " ";
        format = "[$symbol$branch(:$remote_branch)]($style) ";
      };
    };
  };
  programs.fish = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      ll = "${pkgs.exa}/bin/exa --icons --long --sort type -a --git";
      ls = "${pkgs.exa}/bin/exa --icons --sort type -a --git";
      top = "${pkgs.htop}/bin/htop";
      cp = "cp -r";
      rm = "rm -r";
      g = "git";
      p = "pnpm";
      ":q" = "exit";
      ":h" = "man";
      mkdir = "mkdir -p";
      dr = "darwin-rebuild switch --flake ~/.dotfiles#tishka";
      nr = "sudo nixos-rebuild switch --flake ~/.dotfiles#yuki";
      c = "clear";
      wgdn = "wg-quick down wg0";
      wgup = "wg-quick up wg0";
      gl =
        "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
    };
    shellInit = ''
      set TTY1 (tty)
      [ "$TTY1" = "/dev/tty1" ] && exec sway

      set fish_greeting
      set -gx EDITOR (which nvim)
      set -gx VISUAL $EDITOR
      set -gx SUDO_EDITOR $EDITOR
      set -gx XDG_CACHE_HOME ~/.cache
      set -gx MANPAGER "nvim +Man!"

      ${pkgs.nix-your-shell}/bin/nix-your-shell fish | source

      fish_vi_key_bindings

      set -g fish_vi_force_cursor
      set -g fish_cursor_default block
      set -g fish_cursor_insert line
      set -g fish_cursor_replace_one underscore
      set -g fish_cursor_visual block
    '';
  };

  xdg.configFile."fish/themes/light.theme".text = ''
    fish_color_normal 654735
    fish_color_command 45707a
    fish_color_param 945e80
    fish_color_keyword c14a4a
    fish_color_quote 6c782e
    fish_color_redirection 945e80
    fish_color_end c35e0a
    fish_color_comment c9aa8c
    fish_color_error c14a4a
    fish_color_gray c9aa8c
    fish_color_selection --background=dfd6b1
    fish_color_search_match --background=dfd6b1
    fish_color_option 6c782e
    fish_color_operator 945e80
    fish_color_escape c35e0a
    fish_color_autosuggestion c9aa8c -i
    fish_color_cancel c14a4a
    fish_color_cwd a96b2c
    fish_color_user 4c7a5d
    fish_color_host 45707a
    fish_color_host_remote 6c782e
    fish_color_status c14a4a
    fish_pager_color_progress c9aa8c
    fish_pager_color_prefix 945e80
    fish_pager_color_completion 654735
    fish_pager_color_description c9aa8c
  '';
  xdg.configFile."fish/themes/dark.theme".text = ''
    fish_color_normal D4BE98
    fish_color_command 7DAEA3
    fish_color_param D3869B
    fish_color_keyword EA6962
    fish_color_quote A9B665
    fish_color_redirection D3869B
    fish_color_end BD6F3E
    fish_color_comment 5F6365
    fish_color_error EA6962
    fish_color_gray 5F6365
    fish_color_selection --background=2d2f30
    fish_color_search_match --background=2d2f30
    fish_color_option A9B665
    fish_color_operator D3869B
    fish_color_escape BD6F3E
    fish_color_autosuggestion 5F6365 -i
    fish_color_cancel EA6962
    fish_color_cwd D8A657
    fish_color_user 89B482
    fish_color_host 7DAEA3
    fish_color_host_remote A9B665
    fish_color_status EA6962
    fish_pager_color_progress 5F6365
    fish_pager_color_prefix D3869B
    fish_pager_color_completion D4BE98
    fish_pager_color_description 5F6365
  '';
}
