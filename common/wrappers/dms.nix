{
  pkgs,
  package,
}: let
  json = pkgs.formats.json {};
  dmsDefaultConfigFile = json.generate "dms-default-config.json" {
    clockDateFormat = "yyyy-MM-dd";
    weatherEnabled = false;
    dankBarSquareCorners = true;
    nightModeEnabled = true;
    barConfigs.rightWidgets = [
      "systemTray"
      "cpuTemp"
      "cpuUsage"
      "memUsage"
      "notificationButton"
      "battery"
      "controlCenterButton"
    ];
    sortAppsAlphabetically = true;
    appLauncherViewMode = "grid";
    spotlightModalViewMode = "grid";
    fontFamily = "JetBrainsMonoNL Nerd Font";
    monoFontFamily = "JetBransMonoNL Nerd Font Mono";
    launcherLogoMode = "os";
  };
  dmsDefaultSessionFile = json.generate "dms-default-session.json" {
    isLightMode = false;
    nightModeEnabled = true;
    nightModeTemperature = 3000;
    nightModeHighTemperature = 3000;
    nightModeAutoEnabled = false;
  };
in
  pkgs.symlinkJoin {
    name = "dms-wrapped";
    paths = [package];
    buildInputs = [pkgs.makeWrapper];
    # HACK: we do this to avoid dms writting to XDG_CONFIG_HOME and XDG_STATE_DIR.
    # This is a really ugly hack but oh well what can we do...
    postBuild = ''
      mkdir /tmp/DankMaterialShell
      cp ${dmsDefaultConfigFile} /tmp/DankMaterialShell/default-settings.json
      cp ${dmsDefaultSessionFile} /tmp/DankMaterialShell/default-session.json

      wrapProgram $out/bin/dms \
        --set XDG_CONFIG_HOME /tmp \
        --set XDG_STATE_DIR /tmp
    '';
  }
