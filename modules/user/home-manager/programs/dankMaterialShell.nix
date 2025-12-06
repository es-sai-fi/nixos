{inputs, ...}: {
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
  ];

  programs.dankMaterialShell = {
    enable = true;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    enableSystemMonitoring = true;
    enableClipboard = true;
    enableCalendarEvents = true;
    enableSystemSound = true;

    default = {
      session = {
        isLightMode = false;
        nightModeEnabled = true;
        nightModeTemperature = 3000;
        nightModeHighTemperature = 3000;
        nightModeAutoEnabled = false;
      };
      settings = {
        theme = "dark";
        #showDock = true;
        #dockAutoHide = true;
        clockDateFormat = "yyyy-MM-dd";
        weatherEnabled = false;
        dankBarSquareCorners = true;
        nightModeEnabled = true;
      };
    };
  };
}
