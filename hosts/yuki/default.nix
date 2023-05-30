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
    bluetooth.enable = true;
    opengl.enable = true;
  };

  environment = {
    variables = {
      MESA_GL_VERSION_OVERRIDE = "3.3";
      MESA_GLES_VERSION_OVERRIDE = "3.1";
      MESA_GLSL_VERSION_OVERRIDE = "330";
    };
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "wezterm";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_BIN_HOME = "$HOME/.local/bin";
    };
    etc."wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
      bluez_monitor.properties = {
        ["bluez5.enable-sbc-xq"] = true,
        ["bluez5.enable-msbc"] = true,
        ["bluez5.enable-hw-volume"] = true,
        ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
      }
    '';

  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  boot.loader.systemd-boot.enable = true;
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.support32Bit = true;
      alsa.enable = true;
    };
    blueman.enable = true;
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
    "1e1e2e"
    "f38ba8"
    "a6e3a1"
    "f9e2af"
    "89b4fa"
    "f5c2e7"
    "94e2d5"
    "bac2de"

    "585b70"
    "f38ba8"
    "a6e3a1"
    "f9e2af"
    "89b4fa"
    "f5c2e7"
    "94e2d5"
    "a6adc8"
  ];

  fonts.fonts = with pkgs; [ noto-fonts-cjk-sans ];

  networking.hostName = "yuki";
  system.stateVersion = "23.05";
}
