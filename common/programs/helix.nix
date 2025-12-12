{
  system,
  pkgs,
  lib,
  helix,
}: let
  helixWrapped = import ../wrappers/helix.nix {
    inherit pkgs lib;
    helix = helix.packages.${system}.default;
  };
in {
  nix.settings = helix.nixConfig;

  environment = {
    systemPackages = [helixWrapped];
    sessionVariables.EDITOR = "hx";
    sessionVariables.VISUAL = "hx";
  };
}
