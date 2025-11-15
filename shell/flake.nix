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
      default = pkgs.mkShellNoCC {
        name = "default-shell";
        packages = with pkgs; [
          clippy
          rust-analyzer
          typescript-language-server
          biome
          gofumpt
          gopls
          basedpyright
          ruff
          lua-language-server
          stylua
        ];
        shellHook = ''
          fish
        '';
      };

      rust = pkgs.mkShellNoCC {
        name = "rust-shell";
        packages = with pkgs; [
          rustc
          cargo
          clippy
          rust-analyzer
        ];
        shellHook = ''
          fish
        '';
      };

      node =
        pkgs.mkShellNoCC
        {
          name = "node-shell";
          packages = with pkgs; [
            nodejs
            typescript-language-server
            biome
          ];
          shellHook = ''
            fish
          '';
        };

      go = pkgs.mkShellNoCC {
        name = "go-shell";
        packages = with pkgs; [
          go
          gopls
          gofumpt
        ];
        shellHook = ''
          fish
        '';
      };

      python = pkgs.mkShellNoCC {
        name = "python-shell";
        packages = with pkgs; [
          python3
          basedpyright
          ruff
        ];
        shellHook = ''
          fish
        '';
      };

      lua = pkgs.mkShellNoCC {
        name = "lua-shell";
        packages = with pkgs; [
          luajit
          lua-language-server
          stylua
        ];
        shellHook = ''
          fish
        '';
      };
    };
  };
}
