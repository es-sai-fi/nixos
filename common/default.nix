{
  system,
  pkgs,
  lib,
  inputs,
}: {
  imports = [
    (import ./programs {inherit system pkgs lib inputs;})
    (import ./boot.nix {inherit pkgs;})
    (import ./packages.nix {inherit pkgs;})
    ./networking.nix
    ./nix.nix
    ./security.nix
    ./users.nix
    ./variables.nix
  ];
}
