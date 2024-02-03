{ inputs, ... }: {
  imports = [
    ../common
    ./hardware.nix
    inputs.nixos-apple-silicon.nixosModules.apple-silicon-support
  ];

  nixpkgs.overlays = [
    inputs.nixos-apple-silicon.overlays.apple-silicon-overlay
    (final: prev: { mesa = final.mesa-asahi-edge; })
  ];

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
    consoleLogLevel = 0;
    kernelParams = [ "apple_dcp.show_notch=1" ];
    initrd.services.udev.rules = ''
      SUBSYSTEM=="power_supply", KERNEL=="macsmc-battery", ATTR{charge_control_end_threshold}="80"'';
  };

  networking.hostName = "kitaro";
  system.stateVersion = "23.05";
}
