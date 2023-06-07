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
      directory.read_only = " ";
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
      vi = "nvim";
      ll = "${pkgs.exa}/bin/exa --icons --long --sort type -a --git";
      ls = "${pkgs.exa}/bin/exa --icons --sort type -a --git";
      cp = "${pkgs.xcp}/bin/xcp -r";
      top = "${pkgs.htop}/bin/htop";
      lg = "${pkgs.lazygit}/bin/lazygit";
      du = "${pkgs.du-dust}/bin/dust";
      rm = "${pkgs.rm-improved}/bin/rip";
      df = "${pkgs.duf}/bin/duf -theme ansi";
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
      ip = "curl https://ipinfo.io/ip";
      ports = "lsof -i -P -n | grep LISTEN";
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

  xdg.configFile."fish/themes/Catppuccin Mocha.theme".text = ''
    # name: 'Catppuccin mocha'
    # url: 'https://github.com/catppuccin/fish'
    # preferred_background: 1e1e2e

    fish_color_normal cdd6f4
    fish_color_command 89b4fa
    fish_color_param f2cdcd
    fish_color_keyword f38ba8
    fish_color_quote a6e3a1
    fish_color_redirection f5c2e7
    fish_color_end fab387
    fish_color_comment 7f849c
    fish_color_error f38ba8
    fish_color_gray 6c7086
    fish_color_selection --background=313244
    fish_color_search_match --background=313244
    fish_color_option a6e3a1
    fish_color_operator f5c2e7
    fish_color_escape eba0ac
    fish_color_autosuggestion 6c7086
    fish_color_cancel f38ba8
    fish_color_cwd f9e2af
    fish_color_user 94e2d5
    fish_color_host 89b4fa
    fish_color_host_remote a6e3a1
    fish_color_status f38ba8
    fish_pager_color_progress 6c7086
    fish_pager_color_prefix f5c2e7
    fish_pager_color_completion cdd6f4
    fish_pager_color_description 6c7086
  '';
}
