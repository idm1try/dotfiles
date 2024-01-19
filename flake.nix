{
  description = "Nix Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    nur.url = "github:nix-community/nur";

    nixos-apple-silicon = {
      url = "github:tpwrules/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      colors = {
        rosewater = "ff8389";
        flamingo = "ff8389";
        red = "ff8389";
        maroon = "ff8389";
        pink = "ff7eb6";
        mauve = "be95ff";
        peach = "d44a1c";
        yellow = "ab8600";
        green = "08bdba";
        teal = "33b1ff";
        sky = "33b1ff";
        sapphire = "33b1ff";
        blue = "78a9ff";
        lavender = "78a9ff";
        text = "ffffff";
        subtext1 = "f4f4f4";
        subtext0 = "e0e0e0";
        overlay2 = "adadad";
        overlay1 = "949494";
        overlay0 = "7a7a7a";
        surface2 = "4f4f4f";
        surface1 = "383838";
        surface0 = "2e2e2e";
        base = "161616";
        mantle = "0d0d0d";
        crust = "000000";
      };
    in {
      nixosConfigurations."kitaro" = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = { inherit inputs colors; };
        modules = [
          ./hosts/kitaro
          ./hosts/common
          home-manager.nixosModules.home-manager
        ];
      };
    };
}
