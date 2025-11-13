{ inputs, ... }:
{
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
  ];

  programs.dankMaterialShell = {
    enable = true;
    niri = {
      enableSpawn = true;
    };
    systemd.enable = true;
    enableSystemMonitoring = true;
    enableClipboard = true;
    enableCalendarEvents = true;
    enableSystemSound = true;
    default.settings = {
      theme = "dark";
      showDock = true;
      dockAutoHide = true;
      clockDateFormat = "yyyy-MM-dd";
      weatherEnabled = false;
      dankBarSquareCorners = true;
    };
  };
}
