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
}
