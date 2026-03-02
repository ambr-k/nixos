{
  inputs = {
    nixpkgs-2505.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    aporetic-nerd-font = {
      url = "github:echinoidea/aporetic-nerd-font";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    vicinae-extensions = {
      url = "github:vicinaehq/extensions";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = {
    self,
    nixpkgs-2505,
    nixpkgs-unstable,
    home-manager,
    ...
  } @ inputs: let
    secrets = builtins.fromJSON (builtins.readFile ./secrets.json);
    specialArgs = {
      inherit inputs;
      inherit secrets;
    };
    pkgs-config = {...}: {
      nixpkgs.config.allowUnfree = true;
      nixpkgs.overlays = [
        (final: prev: {
          v25_05 = import nixpkgs-2505 {
            system = prev.stdenv.hostPlatform.system;
            config.allowUnfree = true;
          };
        })
      ];
    };
    home-manager-config = {
      user ? "amber",
      modules,
      ...
    }: [
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "bak";
        home-manager.extraSpecialArgs = specialArgs;
        home-manager.users.${user} = {...}: {imports = modules;};
      }
    ];
  in {
    nixosConfigurations.carbon = nixpkgs-unstable.lib.nixosSystem {
      inherit specialArgs;
      modules =
        [
          pkgs-config
          ./hosts/carbon
        ]
        ++ home-manager-config {
          modules = [
            ./home/users/amber/ui.nix
            ./home/users/amber/music_dir.nix
          ];
        };
    };

    nixosConfigurations.lithium = nixpkgs-unstable.lib.nixosSystem {
      inherit specialArgs;
      modules =
        [
          pkgs-config
          ./hosts/lithium
        ]
        ++ home-manager-config {
          modules = [./home/users/amber];
        };
    };

    buildHomeManagerConfiguration = {
      system,
      modules,
      ...
    }: (home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs-unstable.legacyPackages.${system};
      extraSpecialArgs = specialArgs;
      modules =
        [
          pkgs-config
          (import ./home/users/amber)
        ]
        ++ modules;
    });
  };
}
