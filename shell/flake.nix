{
  description = "Devshell for wrapper testing";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };
    dgop = {
      type = "github";
      owner = "AvengeMedia";
      repo = "dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      type = "github";
      owner = "AvengeMedia";
      repo = "DankMaterialShell";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        dgop.follows = "dgop";
      };
    };
    helix = {
      type = "github";
      owner = "helix-editor";
      repo = "helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    devShells.x86_64-linux = {
      helix = let
        helixWrapped = import ../common/wrappers/helix.nix {
          inherit pkgs;
          helix = inputs.helix.packages.system.default;
          lib = pkgs.lib;
        };
      in
        pkgs.mkShellNoCC {
          packages = [
            helixWrapped
          ];
        };
      bottom = let
        bottomWrapped = import ../common/wrappers/bottom.nix {
          inherit pkgs;
        };
      in
        pkgs.mkShellNoCC {
          packages = [
            bottomWrapped
          ];
        };
      yazi = let
        yaziWrapped = import ../common/wrappers/yazi {
          inherit pkgs;
          lib = pkgs.lib;
        };
      in
        pkgs.mkShellNoCC {
          packages = [
            yaziWrapped
          ];
        };
      fish = let
        fishWrapped = import ../common/wrappers/fish {
          inherit pkgs;
        };
      in
        pkgs.mkShellNoCC {
          packages = [
            fishWrapped
          ];
        };
      alacritty = let
        alacrittyWrapped = import ../common/wrappers/alacritty.nix {
          inherit pkgs;
        };
        fishWrapped = import ../common/wrappers/fish {
          inherit pkgs;
        };
      in
        pkgs.mkShellNoCC {
          packages = [
            alacrittyWrapped
            fishWrapped
          ];
        };
      bat = let
        batWrapped = import ../common/wrappers/bat.nix {
          inherit pkgs;
        };
      in
        pkgs.mkShellNoCC {
          packages = [
            batWrapped
          ];
        };
    };
  };
}
