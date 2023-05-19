{ pkgs, lib, ... }:
lib.mkIf pkgs.stdenv.isLinux {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland.override { plugins = [ pkgs.rofi-calc ]; };
    font = "CartographCF Nerd Font 12";
    extraConfig.icon-theme = "Papirus-Dark";
    terminal = "wezterm";
    theme = ./theme.rasi;
  };
}
