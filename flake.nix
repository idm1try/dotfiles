{
  description = "Nix Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
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
        rosewater = "da1e28";
        flamingo = "da1e28";
        red = "da1e28";
        maroon = "da1e28";
        pink = "d02670";
        mauve = "8a3ffc";
        peach = "d44a1c";
        yellow = "ab8600";
        green = "007d79";
        teal = "1192e8";
        sky = "1192e8";
        sapphire = "1192e8";
        blue = "0f62fe";
        lavender = "0f62fe";
        text = "000000";
        subtext1 = "404040";
        subtext0 = "474747";
        overlay2 = "575757";
        overlay1 = "595959";
        overlay0 = "737373";
        surface2 = "8c8c8c";
        surface1 = "d1d1d1";
        surface0 = "e6e6e6";
        base = "FFFFFF";
        mantle = "f2f2f2";
        crust = "ebebeb";
      };
    in {
      nixosConfigurations."fuku" = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = { inherit inputs colors; };
        modules = [
          ./hosts/fuku
          ./hosts/common
          home-manager.nixosModules.home-manager
        ];
      };
    };
}
