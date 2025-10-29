{
  description = "System flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri.url = "github:sodiboo/niri-flake";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, nixpkgs, home-manager, niri, aagl, neovim-nightly-overlay, ... }: {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
	home-manager.nixosModules.default
        ({ pkgs, ... }: {
          imports = [ niri.nixosModules.niri ];
          nixpkgs.overlays = [ niri.overlays.niri ];
          programs.niri = {
            enable = true;
            package = pkgs.niri-unstable;
          };
        })
        ({ pkgs, ... }: {
          imports = [ aagl.nixosModules.default ];
          nix.settings = aagl.nixConfig;
          programs.anime-game-launcher.enable = true;
          programs.honkers-railway-launcher.enable = true;
          programs.sleepy-launcher.enable = true;
        })
        ({ pkgs, ... }: {
          nixpkgs.overlays = [ neovim-nightly-overlay.overlays.default ];
          programs.neovim = {
            enable = true;
            package = pkgs.neovim;
          };
        })
      ];
    };
  };
}
