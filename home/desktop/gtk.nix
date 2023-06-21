{ pkgs, lib, ... }:
lib.mkIf pkgs.stdenv.isLinux {
  gtk = {
    enable = true;
    font = {
      name = "CartographCF Nerd Font";
      size = 12;
    };
    gtk2.configLocation = "/home/idm1try/.config/gtk-2.0/gtkrc";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };
  xdg.configFile."gtk-3.0/gtk.css".text = ''
    window decoration {
      box-shadow: none;
    }

    .titlebar,
    .titlebar .background {
      border-radius: 0px 0px 0px 0px;
    }
  '';
  home.pointerCursor = {
    name = "volantes_cursors";
    package = pkgs.volantes-cursors;
    gtk.enable = true;
    size = 24;
  };
}
