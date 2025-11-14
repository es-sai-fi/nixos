{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.x86_64-linux = {
        rust = pkgs.mkShell {
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

        node = pkgs.mkShell {
          name = "node-shell";
          packages = with pkgs; [
            nodejs
            vtsls
            biome
          ];
          shellHook = ''
            fish
          '';
        };

        go = pkgs.mkShell {
          name = "go-shell";
          packages = with pkgs; [
            go
            gopls
          ];
          shellHook = ''
            fish
          '';
        };

        python = pkgs.mkShell {
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

        lua = pkgs.mkShell {
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
