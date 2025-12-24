{
  description = "One flake to rule them All";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
  in {
    nixosConfigurations.k1 = lib.nixosSystem {
      system = system;
      modules = [
        ./nixos/configuration.nix
      ];
    };

    homeConfigurations.k1 = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."${system}";
      modules = [
        ./home-manager/home.nix
      ];
      extraSpecialArgs = {inherit inputs;};
    };
  };
}
