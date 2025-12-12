{
  system,
  pkgs,
  dmsPackage,
  dgopPackage,
}: let
  dmsWrapped = import ../wrappers/dms.nix {
    inherit pkgs dmsPackage;
  };
in {
  environment.systePackages = [dgopPackage];

  programs.dms-shell = {
    enable = true;
    package = dmsWrapped;
    systemd.restartIfChanged = true;
    enableVPN = false;
    enableSystemSound = false;
    enableSystemMonitoring = false; # We use a custom dgop package.
    enableDynamicTheming = false;
    enableColorPicker = false;
    enableClipboard = false;
    enableCalendarEvents = false;
    enableBrightnessControl = false;
    enableAudioWavelength = false;
  };
}
