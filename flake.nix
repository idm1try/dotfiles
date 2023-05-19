{
  description = "Nix Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";

    nixos-apple-silicon = {
      url = "github:quentini/nixos-apple-silicon/dev";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    crane = {
      url = "github:ipetkov/crane";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wezterm-src = {
      type = "git";
      url = "https://github.com/wez/wezterm.git";
      ref = "main";
      submodules = true;
      flake = false;
    };
  };
  outputs = { nixpkgs, darwin, home-manager, ... }@inputs: {
    nixosConfigurations."yuki" = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/yuki
        ./hosts/common.nix
        home-manager.nixosModules.home-manager
      ];
    };
    darwinConfigurations."tishka" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/tishka.nix
        ./hosts/common.nix
        home-manager.darwinModules.home-manager
      ];
    };
  };
}
