{
  inputs,
  lib,
  pkgs,
  ...
}: let
  helixWrapped = import ../wrappers/helix.nix {
    inherit pkgs lib;
    helix = inputs.helix;
  };
in {
  nix.settings = inputs.helix.nixConfig;

  environment = {
    systemPackages = [helixWrapped];
    sessionVariables.EDITOR = "hx";
  };
}
