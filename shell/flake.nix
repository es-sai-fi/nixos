{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
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
          ];
          shellHook = ''
            fish
          ''
        };

        node = pkgs.mkShell {
          name = "node-shell";
          packages = with pkgs; [
            nodejs
          ];
          shellHook = ''
            fish
          ''
        };

        go = pkgs.mkShell {
          name = "go-shell";
          packages = with pkgs; [
            go
          ];
          shellHook = ''
            fish
          ''
        };

        python = pkgs.mkShell {
          name = "python3";
          inputsFrom = [ self.devShells.x86_64-linux.nvim ];
          packages = with pkgs; [
            python3
          ];
          shellHook = ''
            fish
          ''
        };
      };
    };
}
