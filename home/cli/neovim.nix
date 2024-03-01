{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    vimdiffAlias = true;
    extraPackages = with pkgs; [
      stylua
      lua-language-server

      tailwindcss-language-server
      nodePackages.typescript
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      nodePackages.yaml-language-server

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
    source = config.lib.file.mkOutOfStoreSymlink ../../configs/nvim;
    recursive = true;
  };
}
