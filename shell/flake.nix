{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells = {
        nvim = pkgs.mkShell {
          name = "nvim-shell";
          packages = with pkgs; [
            llvmPackages_20.clang-tools
            lua-language-server
            gopls
            rust_analyzer
            basedpyright
            vtsls
            taplo
            # yamlls
            nil_ls

            stylua
            gofmt
            rustfmt
            ruff
            biome
            taplo
            yamlfmt
            alejandra

            luajitPackages.luacheck
            golangci-lint
            clippy
            statix
          ];
        };

        rust = pkgs.mkShell {
          name = "rust-shell";
          inputsFrom = [ self.devShells.nvim ];
          packages = with pkgs; [
            rustc
            cargo
          ];
        };

        node = pkgs.mkShell {
          name = "node-shell";
          inputsFrom = [ self.devShells.nvim ];
          packages = with pkgs; [
            nodejs
          ];
        };
      };
    };
}
