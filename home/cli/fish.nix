{ colors, pkgs, ... }: {
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
      ll = "${pkgs.eza}/bin/eza --icons --long --sort type -a --git";
      ls = "${pkgs.eza}/bin/eza --icons --sort type -a --git";
      top = "${pkgs.htop}/bin/htop";
      cp = "cp -r";
      rm = "rm -r";
      ":q" = "exit";
      ":h" = "man";
      mkdir = "mkdir -p";
      nr = "sudo nixos-rebuild switch --flake ~/.dotfiles#fuku";
      c = "clear";
      wgdn = "wg-quick down wg0";
      wgup = "wg-quick up wg0";
      gl =
        "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
    };
    shellInit = ''
      set TTY1 (tty)
      [ "$TTY1" = "/dev/tty1" ] && exec sway
      fish_config theme choose theme

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

  xdg.configFile."fish/themes/theme.theme".text = ''
    fish_color_normal ${colors.text}
    fish_color_command ${colors.blue}
    fish_color_param ${colors.pink}
    fish_color_keyword ${colors.flamingo}
    fish_color_quote ${colors.blue}
    fish_color_redirection ${colors.mauve}
    fish_color_end ${colors.peach}
    fish_color_comment ${colors.overlay0}
    fish_color_error ${colors.red}
    fish_color_gray ${colors.overlay0}
    fish_color_selection --background=${colors.surface0}
    fish_color_search_match --background=${colors.surface0}
    fish_color_option ${colors.green}
    fish_color_operator ${colors.pink}
    fish_color_escape ${colors.peach}
    fish_color_autosuggestion ${colors.overlay0} -i
    fish_color_cancel ${colors.red}
    fish_color_cwd ${colors.yellow}
    fish_color_user ${colors.teal}
    fish_color_host ${colors.lavender}
    fish_color_host_remote ${colors.green}
    fish_color_status ${colors.maroon}
    fish_pager_color_progress ${colors.overlay0}
    fish_pager_color_prefix ${colors.mauve}
    fish_pager_color_completion ${colors.text}
    fish_pager_color_description ${colors.overlay0}
  '';
}
