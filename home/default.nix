{ pkgs, config, ... }: {
  imports = [
    ./cli/git.nix
    ./cli/fish.nix
    ./cli/neovim.nix
    ./cli/gpg.nix
    ./cli/aerc.nix

    ./desktop/gtk.nix
    ./desktop/dunst.nix
    ./desktop/sway.nix
    ./desktop/firefox.nix
    ./desktop/waybar.nix
  ];
  home.stateVersion = "21.11";
  home.packages = with pkgs; [
    ripgrep
    wireguard-tools
    wireguard-go
    wezterm
    nodejs
    nodePackages.pnpm
  ];
  xdg.configFile."wezterm" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "/home/idm1try/.dotfiles/configs/wezterm";
    recursive = true;
  };
}
