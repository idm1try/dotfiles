{ pkgs, config, ... }: {
  imports = [
    ./cli/git.nix
    ./cli/fish.nix
    ./cli/neovim.nix
    ./cli/himalaya.nix

    ./desktop/gtk.nix
    ./desktop/sway.nix
    ./desktop/firefox.nix
    ./desktop/waybar.nix
  ];
  home.stateVersion = "21.11";
  home.packages = with pkgs; [ ripgrep wezterm fd nodejs bun rink pfetch-rs ];
  xdg.configFile."wezterm" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "/home/idm1try/.dotfiles/configs/wezterm";
    recursive = true;
  };
}
