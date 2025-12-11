{
  inputs,
  lib,
  pkgs,
  ...
}: let
  helixWrapped = import ../wrappers/helix.nix {
    inherit pkgs lib;
    helix = inputs.helix.packages.${pkgs.stdenv.hostPlaform.system}.default;
  };
in {
  nix.settings = inputs.helix.nixConfig;

  environment = {
    systemPackages = [helixWrapped];
    sessionVariables.EDITOR = "hx";
  };
}
