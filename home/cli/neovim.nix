{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    vimdiffAlias = true;
    extraPackages = with pkgs; [
      stylua
      lua-language-server

      nodePackages."@tailwindcss/language-server"
      nodePackages.typescript
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      nodePackages.yaml-language-server

      cargo
      taplo
      rust-analyzer
      rustc
      rustfmt

      dprint
      nil
      nixfmt
      tree-sitter

      fzf
      gcc
      gnumake
      unzip
    ];
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "/${
        if pkgs.stdenv.hostPlatform.isDarwin then "Users" else "home"
      }/idm1try/.dotfiles/configs/nvim";
    recursive = true;
  };
}
