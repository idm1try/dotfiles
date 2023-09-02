{ pkgs, inputs, ... }: {
  imports = [
    ../common
    ./hardware.nix
    inputs.nixos-apple-silicon.nixosModules.apple-silicon-support
  ];

  nixpkgs.overlays = [
    inputs.nixos-apple-silicon.overlays.apple-silicon-overlay
    (import ../../overlays/binscripts.nix)
    (import ../../overlays/asahi.nix)
    (final: prev: {
      phocus-oxocarbon =
        prev.callPackage ../../overlays/phocus-oxocarbon.nix { };
    })
  ];

  environment.systemPackages = [ pkgs.asahi-alsa-utils ];

  systemd.user.services.fix-asahi-jack = {
    script = ''
      ${pkgs.asahi-alsa-utils}/bin/amixer -c 0 set 'Jack DAC' 100%
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

  boot = {
    initrd.verbose = false;
    consoleLogLevel = 0;
    kernel.sysctl."printk" = "3 3 3 3";
    kernelParams = [
      "quiet"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
      "apple_dcp.show_notch=1"
    ];
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="power_supply", KERNEL=="macsmc-battery", ATTR{charge_control_end_threshold}="80"'';

  networking.hostName = "fuku";
  system.stateVersion = "23.05";
}
