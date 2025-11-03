{ inputs, ... }:
{
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
  ];

  programs.dankMaterialShell = {
    enable = true;
    niri = {
      enabledKeybinds = true;
      enableSpawn = true;
    };
    enableSystemd = true;
    enableSystemMonitoring = true;
    enableClipboard = true;
    enableCalendarEvents = true;
    enableSystemSound = true;
    default.settings = {
      theme = "dark";
    };
  };
}
