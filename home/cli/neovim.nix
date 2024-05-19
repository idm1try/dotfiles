{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    vimdiffAlias = true;
    withRuby = false;
    withPython3 = false;
    extraPackages = with pkgs; [
      stylua
      lua-language-server

      rust-analyzer
      rustfmt

      tailwindcss-language-server
      nodePackages.typescript
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      nodePackages.yaml-language-server

      dprint
      nil
      nixfmt-classic

      fzf
      gnumake
      unzip
    ];
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "/home/idm1try/.dotfiles/configs/nvim";
    recursive = true;
  };
}
