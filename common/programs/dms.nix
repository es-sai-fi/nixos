{
  system,
  pkgs,
  dms,
}: let
  dmsWrapped = import ../wrappers/dms.nix {
    inherit pkgs;
    package = dms.packages.${system}.default;
  };
in {
  imports = [
    dms.nixosModules.dankMaterialShell.default
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
