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
  boot.initrd.verbose = false;
  boot.consoleLogLevel = 0;
  boot.kernel.sysctl."printk" = "3 3 3 3";
  boot.kernelParams = [
    "quiet"
    "udev.log_priority=3"
    "rd.systemd.show_status=auto"
    "apple_dcp.show_notch=1"
  ];

  networking.hostName = "fuku";
  system.stateVersion = "23.05";
}
