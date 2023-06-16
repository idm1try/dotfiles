{ ... }: {
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
    };
  };

  security.rtkit.enable = true;
}
