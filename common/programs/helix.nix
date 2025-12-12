{
  system,
  pkgs,
  lib,
  helix,
}: let
  helixWrapped = import ../wrappers/helix.nix {
    inherit pkgs lib;
    helixPackage = helix.packages.${system}.default;
  };
in {
  nix.settings = {
    extra-substituters = ["https://helix.cachix.org"];
    extra-trusted-public-keys = [
      "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
    ];
  };
  environment = {
    systemPackages = [helixWrapped];
    sessionVariables.EDITOR = "hx";
    sessionVariables.VISUAL = "hx";
  };
}
