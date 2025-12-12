{
  system,
  pkgs,
  lib,
  inputs,
}: let
  inherit (inputs) aagl dms helix niri;
in {
  imports = [
    (import ./aagl.nix {inherit aagl;})
    (import ./alacritty.nix {inherit pkgs;})
    (import ./bat.nix {inherit pkgs;})
    (import ./bottom.nix {inherit pkgs;})
    (import ./dms.nix {inherit pkgs dms;})
    (import ./fish.nix {inherit pkgs;})
    (import ./fzf.nix {inherit pkgs;})
    (import ./git.nix {inherit pkgs;})
    (import ./helix.nix {inherit system pkgs lib helix;})
    (import ./niri.nix {inherit pkgs niri;})
    (import ./tealdeer.nix {inherit pkgs;})
    (import ./yazi.nix {inherit pkgs lib;})
    ./dconf.nix
    ./starship.nix
    ./zoxide.nix
  ];
}
