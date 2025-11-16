{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    devShells.x86_64-linux = {
      rust = pkgs.mkShellNoCC {
        name = "rust-shell";
        packages = with pkgs; [
          rustc
          cargo
        ];
        shellHook = ''
          fish
        '';
      };

      node = pkgs.mkShellNoCC {
        name = "node-shell";
        packages = with pkgs; [
          nodejs
        ];
        shellHook = ''
          fish
        '';
      };

      go = pkgs.mkShellNoCC {
        name = "go-shell";
        packages = with pkgs; [
          go
        ];
        shellHook = ''
          fish
        '';
      };

      python = pkgs.mkShellNoCC {
        name = "python-shell";
        packages = with pkgs; [
          python3
        ];
        shellHook = ''
          fish
        '';
      };

      lua = pkgs.mkShellNoCC {
        name = "lua-shell";
        packages = with pkgs; [
          luajit
        ];
        shellHook = ''
          fish
        '';
      };
    };
  };
}
