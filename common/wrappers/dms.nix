{
  dms,
  pkgs,
}: let
  json = pkgs.formats.json {};
  dmsDefaultConfigFile = json.generate "dms-default-config.json" {
    theme = "dark";
    clockDateFormat = "yyyy-MM-dd";
    weatherEnabled = false;
    dankBarSquareCorners = true;
    nightModeEnabled = true;
    rightWidgets = [
      "systemTray"
      "cpuUsage"
      "memUsage"
      "notificationButton"
      "battery"
      "controlCenterButton"
    ];
  };
  dmsDefaultSessionFile = json.generate "dms-default-session.json" {
    isLightMode = false;
    nightModeEnabled = true;
    nightModeTemperature = 3000;
    nightModeHighTemperature = 3000;
    nightModeAutoEnabled = false;
  };
in {
  dmsWrapped = pkgs.symlinkJoin {
    name = "dms-wrapped";
    paths = [dms.packages.${pkgs.stdenv.hostPlatform.system}.default];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      mkdir $out/DankMaterialShell
      cp ${dmsDefaultConfigFile} $out/DankMaterialShell/default-settings.json
      cp ${dmsDefaultSessionFile} $out/DankMaterialShell/default-session.json

      wrapProgram $out/bin/dms \
        -set XDG_CONFIG_HOME $out \
        -set XDG_STATE_DIR $out
    '';
  };
}
