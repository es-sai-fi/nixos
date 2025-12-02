{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [inputs.niri-flake.overlays.niri];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gnome
    ];
    config = {
      niri.default = "gnome";
      common.default = "gnome";
      obs.default = "gnome";
    };
  };

  hjem.users.es-sai-fi.rum.desktops.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    spawn-at-startup = [["${pkgs.xwayland-satellite-unstable}/bin/xwayland-satellite"]];
    configFile = pkgs.writeText "config.kdl" (builtins.readFile ./config.kdl);
    binds = {
      "Mod+T".action.spawn = ["alacritty"];
      "Mod+E".action.spawn = ["alacritty" "-e" "fish" "-c" "hx"];
      "Mod+B".action.spawn = ["librewolf"];
      "Mod+Y".action.spawn = ["alacritty" "-e" "fish" "-c" "yazi"];

      "Mod+O" = {
        action = "toggle-overview";
        parameters.repeat = false;
      };

      "Mod+Q" = {
        action = "close-window";
        parameters.repeat = false;
      };

      "Mod+Left".action = "focus-column-left";
      "Mod+Down".action = "focus-window-down";
      "Mod+Up".action = "focus-window-up";
      "Mod+Right".action = "focus-column-right";

      "Mod+Ctrl+Left".action = "move-column-left";
      "Mod+Ctrl+Down".action = "move-window-down";
      "Mod+Ctrl+Up".action = "move-window-up";
      "Mod+Ctrl+Right".action = "move-column-right";

      "Mod+H".action = "focus-column-left";
      "Mod+J".action = "focus-window-or-workspace-down";
      "Mod+K".action = "focus-window-or-workspace-up";
      "Mod+L".action = "focus-column-right";

      "Mod+U".action = "focus-workspace-down";
      "Mod+I".action = "focus-workspace-up";

      "Mod+Shift+H".action = "move-column-left";
      "Mod+Shift+J".action = "move-window-down-or-to-workspace-down";
      "Mod+Shift+K".action = "move-window-up-or-to-workspace-up";
      "Mod+Shift+L".action = "move-column-right";

      "Mod+Shift+U".action = "move-column-to-workspace-down";
      "Mod+Shift+I".action = "move-column-to-workspace-up";

      "Mod+1".action = "focus-workspace 1";
      "Mod+2".action = "focus-workspace 2";
      "Mod+3".action = "focus-workspace 3";
      "Mod+4".action = "focus-workspace 4";
      "Mod+5".action = "focus-workspace 5";
      "Mod+6".action = "focus-workspace 6";
      "Mod+7".action = "focus-workspace 7";
      "Mod+8".action = "focus-workspace 8";
      "Mod+9".action = "focus-workspace 9";

      "Mod+Shift+1".action = "move-column-to-workspace 1";
      "Mod+Shift+2".action = "move-column-to-workspace 2";
      "Mod+Shift+3".action = "move-column-to-workspace 3";
      "Mod+Shift+4".action = "move-column-to-workspace 4";
      "Mod+Shift+5".action = "move-column-to-workspace 5";
      "Mod+Shift+6".action = "move-column-to-workspace 6";
      "Mod+Shift+7".action = "move-column-to-workspace 7";
      "Mod+Shift+8".action = "move-column-to-workspace 8";
      "Mod+Shift+9".action = "move-column-to-workspace 9";

      "Mod+BracketLeft".action = "consume-or-expel-window-left";
      "Mod+BracketRight".action = "consume-or-expel-window-right";

      "Mod+Comma".action = "consume-window-into-column";
      "Mod+Period".action = "expel-window-from-column";

      "Mod+F".action = "maximize-column";
      "Mod+Shift+F".action = "fullscreen-window";

      "Mod+C".action = "center-column";
      "Mod+Ctrl+C".action = "center-visible-columns";

      "Mod+V".action = "toggle-window-floating";
      "Mod+Shift+V".action = "switch-focus-between-floating-and-tiling";

      Print.action = "screenshot";
      "Shift+Print".action = "screenshot-screen";
      "Ctrl+Print".action = "screenshot-window";

      # DMS

      "Mod+Space".action.spawn = ["dms" "ipc" "call" "spotlight" "toggle"];

      "Mod+Escape".action.spawn = ["dms" "ipc" "call" "settings" "toggle"];

      "Mod+N".action.spawn = ["dms" "ipc" "call" "notifications" "toggle"];

      "Mod+M".action.spawn = ["dms" "ipc" "call" "processlist" "toggle"];

      "Mod+Shift+N".action.spawn = ["dms" "ipc" "call" "notepad" "toggle"];

      "Mod+Alt+L".action.spawn = ["dms" "ipc" "call" "lock" "lock"];

      "XF86AudioRaiseVolume" = {
        action.spawn = ["dms" "ipc" "call" "audio" "increment" "3"];
        parameters.allow-when-locked = true;
      };
      "XF86AudioLowerVolume" = {
        action.spawn = ["dms" "ipc" "call" "audio" "decrement" "3"];
        parameters.allow-when-locked = true;
      };

      "XF86AudioMute" = {
        action.spawn = ["dms" "ipc" "call" "audio" "mute"];
        parameters.allow-when-locked = true;
      };
      "XF86AudioMicMute" = {
        action.spawn = ["dms" "ipc" "call" "audio" "micmute"];
        parameters.allow-when-locked = true;
      };
    };
  };
}
