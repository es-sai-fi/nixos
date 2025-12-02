{
  description = "System flake";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };
    nixos-hardware = {
      type = "github";
      owner = "NixOS";
      repo = "nixos-hardware";
    };
    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aagl = {
      type = "github";
      owner = "ezKEa";
      repo = "aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-flake = {
      type = "github";
      owner = "sodiboo";
      repo = "niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-flake = {
      type = "github";
      owner = "es-sai-fi";
      repo = "neovim-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak = {
      type = "github";
      owner = "gmodena";
      repo = "nix-flatpak";
    };
    dgop = {
      type = "github";
      owner = "AvengeMedia";
      repo = "dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankMaterialShell = {
      type = "github";
      owner = "AvengeMedia";
      repo = "DankMaterialShell";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        dgop.follows = "dgop";
      };
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    ...
  }: {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {inherit inputs;};

      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        ./modules
        inputs.nixos-hardware.nixosModules.common-cpu-amd-zenpower
        {
          imports = [
            inputs.home-manager.nixosModules.default
          ];

          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;};
          };
        }
      ];
    };
  };
}
