{
  system,
  pkgs,
  lib,
  inputs,
}: let
  inherit (inputs) aagl helix;
  dmsPackage = inputs.dms.packages.${system}.default;
  dgopPackage = inputs.dgop.packages.${system}.default;
in {
  imports = [
    (import ./aagl.nix {inherit aagl;})
    (import ./alacritty.nix {inherit pkgs;})
    (import ./bat.nix {inherit pkgs;})
    (import ./bottom.nix {inherit pkgs;})
    (import ./dms.nix {inherit system pkgs dmsPackage dgopPackage;})
    (import ./fish.nix {inherit pkgs;})
    (import ./fzf.nix {inherit pkgs;})
    (import ./git.nix {inherit pkgs;})
    (import ./helix.nix {inherit system pkgs lib helix;})
    (import ./niri.nix {inherit pkgs;})
    (import ./tealdeer.nix {inherit pkgs;})
    (import ./yazi.nix {inherit pkgs lib;})
    ./dconf.nix
    ./nh.nix
    ./starship.nix
    ./zoxide.nix
  ];
}
