{ pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-apple-silicon.nixosModules.apple-silicon-support
  ];

  nixpkgs.overlays = [
    inputs.nixos-apple-silicon.overlays.apple-silicon-overlay
    (import ../../overlays/binscripts.nix)
    (import ../../overlays/asahi.nix)
  ];

  environment.systemPackages = [ pkgs.asahi-alsa-utils ];

  systemd.user.services.fix-asahi-jack = {
    script = ''
      ${pkgs.asahi-alsa-utils}/bin/amixer -c 0 set 'Jack Mixer' 100%
    '';
    wantedBy = [ "default.target" ];
  };

  hardware = {
    asahi = {
      addEdgeKernelConfig = true;
      peripheralFirmwareDirectory = ./firmware;
      useExperimentalGPUDriver = true;
      experimentalGPUInstallMode = "driver";
      withRust = true;
    };
    opengl.enable = true;
  };

  environment = {
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "wezterm";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_BIN_HOME = "$HOME/.local/bin";
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  boot.loader.systemd-boot.enable = true;
  networking.networkmanager.enable = true;
  # block proprietary shit
  networking.extraHosts = ''
    0.0.0.0 youtube.com
    0.0.0.0 www.youtube.com
    0.0.0.0 reddit.com
    0.0.0.0 www.reddit.com
    0.0.0.0 ufanet.ru
    0.0.0.0 www.ufanet.ru
    0.0.0.0 mail.ru
    0.0.0.0 www.mail.ru
    0.0.0.0 twitter.com
    0.0.0.0 www.twitter.com
    0.0.0.0 news.ycombinator.com
  '';
  systemd.services.NetworkManager-wait-online.enable = false;

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
    };
    upower.enable = true;
    fstrim.enable = true;
    timesyncd.enable = true;
  };

  security.rtkit.enable = true;

  zramSwap.enable = true;

  time.timeZone = "Asia/Yekaterinburg";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings.LC_TIME = "en_US.UTF-8";
    supportedLocales = [ "en_US.UTF-8/UTF-8" "ja_JP.UTF-8/UTF-8" ];
  };

  programs = {
    dconf.enable = true;
    fish.enable = true;
  };

  users.users.idm1try = {
    isNormalUser = true;
    home = "/home/idm1try";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "render" "input" ];
    shell = pkgs.fish;
  };

  console.colors = [
    "fbf1c7"
    "c14a4a"
    "6c782e"
    "a96b2c"
    "45707a"
    "945e80"
    "4c7a5d"
    "654735"

    "A79C86"
    "c14a4a"
    "6c782e"
    "a96b2c"
    "45707a"
    "945e80"
    "4c7a5d"
    "c9aa8c"
  ];

  networking.hostName = "yuki";
  system.stateVersion = "23.05";
}
