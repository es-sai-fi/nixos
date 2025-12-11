{
  inputs,
  pkgs,
  ...
}: let
  dmsWrapped = import ../wrappers/dms.nix {
    inherit pkgs;
    dms = inputs.dms.packages.${pkgs.stdenv.hostPlaform.system}.default;
  };
in {
  imports = [
    inputs.dms.nixosModules.dankMaterialShell.default
  ];

  programs.dankMaterialShell = {
    enable = true;
    package = dmsWrapped;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    enableSystemMonitoring = true;
  };
}
