{ pkgs, ... }: {
  gtk = {
    enable = true;
    font = {
      name = "CartographCF Nerd Font";
      size = 12;
    };
    gtk2.configLocation = "/home/idm1try/.config/gtk-2.0/gtkrc";
  };
  home.pointerCursor = {
    name = "phinger-cursors";
    package = pkgs.phinger-cursors;
    gtk.enable = true;
    size = 24;
  };
}
