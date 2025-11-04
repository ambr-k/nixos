{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aporetic-nerd-font = {
      url = "github:echinoidea/aporetic-nerd-font";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    vicinae.url = "github:vicinaehq/vicinae";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    aporetic-nerd-font,
    ...
  }@inputs: let
      system = "x86_64-linux";
      specialArgs = {
        inherit system;
        inherit inputs;
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      };
  in {
    nixosConfigurations.carbon = nixpkgs.lib.nixosSystem {

      inherit specialArgs;
      
      modules = [

        ./hosts/carbon

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bak";
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.users.amber = import ./home/users/amber;
        }

      ];
    };
  };
}

