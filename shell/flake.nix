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
        pkgs.mkShell {
          packages = [
            helixWrapped
          ];
        };
      dms = let
        dmsWrapped = import ../common/wrappers/dms.nix {
          inherit pkgs;
          dms = inputs.dms.packages.system.default;
        };
      in
        pkgs.mkShellNoCC {packages = [dmsWrapped];};
    };
  };
}
