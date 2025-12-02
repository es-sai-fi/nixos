{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.niri = {
    settings = {
      hotkey-overlay.skip-at-startup = true;
      prefer-no-csd = true;
      screenshot-path = "~/Pictures/screenshots/Niri %Y-%m-%d %H-%M-%S.png";
      gestures.hot-corners.enable = false;

      xwayland-satellite = {
        enable = true;
        path = lib.getExe pkgs.xwayland-satellite-unstable;
      };

      input = {
        keyboard = {
          xkb = {
            layout = "us,es";
            options = "grp:alt_shift_toggle";
          };
          track-layout = "window";
        };
        mouse = {
          accel-speed = -0.2;
          accel-profile = "flat";
        };
      };

      outputs."HDMI-A-1" = {
        mode = {
          height = 1080;
          width = 1920;
          refresh = 199.997;
        };
        scale = 1;
      };

      layout = {
        gaps = 4;
        center-focused-column = "never";
        default-column-width.proportion = 0.5;

        preset-column-widths = [
          {proportion = 0.25;}
          {proportion = 0.5;}
          {proportion = 0.75;}
          {proportion = 1.0;}
        ];

        focus-ring = {
          width = 2;
          active.color = "#b0c6ff";
          inactive.color = "#8f9099";
          urgent.color = "#ffb4ab";
        };
      };

      window-rules = [
        {
          matches = [
            {
              app-id = "firefox$";
              title = "^Picture-in-Picture$";
            }
          ];
          open-floating = true;
        }
        {
          matches = [
            {
              app-id = "neovide";
            }
          ];
          open-maximized = true;
        }
        {
          clip-to-geometry = true;
          tiled-state = true;
          draw-border-with-background = false;
        }
      ];

      binds = with config.lib.niri.actions; {
        "Mod+T".action = spawn "alacritty";
        "Mod+E".action = spawn "neovide";
        "Mod+B".action = spawn "librewolf";
        "Mod+Y".action = spawn ["alacritty" "-e" "fish" "-c" "yazi"];

        "Super+Shift+F1".action = spawn ["alacritty" "-e" "obs-cmd" "recording" "start"];
        "Super+Shift+F2".action = spawn ["alacritty" "-e" "obs-cmd" "recording" "stop"];
        "Super+Shift+F3".action = spawn ["alacritty" "-e" "obs-cmd" "recording" "pause"];
        "Super+Shift+F4".action = spawn ["alacritty" "-e" "obs-cmd" "recording" "resume"];

        "Mod+O" = {
          action = toggle-overview;
          repeat = false;
        };

        "Mod+Q" = {
          action = close-window;
          repeat = false;
        };

        "Mod+Left".action = focus-column-left;
        "Mod+Down".action = focus-window-down;
        "Mod+Up".action = focus-window-up;
        "Mod+Right".action = focus-column-right;

        "Mod+Ctrl+Left".action = move-column-left;
        "Mod+Ctrl+Down".action = move-window-down;
        "Mod+Ctrl+Up".action = move-window-up;
        "Mod+Ctrl+Right".action = move-column-right;

        "Mod+H".action = focus-column-left;
        "Mod+J".action = focus-window-or-workspace-down;
        "Mod+K".action = focus-window-or-workspace-up;
        "Mod+L".action = focus-column-right;

        "Mod+U".action = focus-workspace-down;
        "Mod+I".action = focus-workspace-up;

        "Mod+Ctrl+H".action = move-column-left;
        "Mod+Ctrl+J".action = move-window-down-or-to-workspace-down;
        "Mod+Ctrl+K".action = move-window-up-or-to-workspace-up;
        "Mod+Ctrl+L".action = move-column-right;

        "Mod+Ctrl+U".action = move-column-to-workspace-down;
        "Mod+Ctrl+I".action = move-column-to-workspace-up;

        "Mod+WheelScrollDown" = {
          action = focus-workspace-down;
          cooldown-ms = 150;
        };

        "Mod+WheelScrollUp" = {
          action = focus-workspace-up;
          cooldown-ms = 150;
        };

        "Mod+Ctrl+WheelScrollDown" = {
          action = move-column-to-workspace-down;
          cooldown-ms = 150;
        };

        "Mod+Ctrl+WheelScrollUp" = {
          action = move-column-to-workspace-up;
          cooldown-ms = 150;
        };

        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;

        "Mod+Ctrl+1".action.move-column-to-workspace = 1;
        "Mod+Ctrl+2".action.move-column-to-workspace = 2;
        "Mod+Ctrl+3".action.move-column-to-workspace = 3;
        "Mod+Ctrl+4".action.move-column-to-workspace = 4;
        "Mod+Ctrl+5".action.move-column-to-workspace = 5;
        "Mod+Ctrl+6".action.move-column-to-workspace = 6;
        "Mod+Ctrl+7".action.move-column-to-workspace = 7;
        "Mod+Ctrl+8".action.move-column-to-workspace = 8;
        "Mod+Ctrl+9".action.move-column-to-workspace = 9;

        "Mod+BracketLeft".action = consume-or-expel-window-left;
        "Mod+BracketRight".action = consume-or-expel-window-right;

        "Mod+Comma".action = consume-window-into-column;
        "Mod+Period".action = expel-window-from-column;

        "Mod+R".action = switch-preset-column-width;
        "Mod+Shift+R".action = switch-preset-window-height;
        "Mod+Ctrl+R".action = reset-window-height;
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;

        "Mod+C".action = center-column;
        "Mod+Ctrl+C".action = center-visible-columns;

        "Mod+Minus".action = set-column-width "-10%";
        "Mod+Equal".action = set-column-width "+10%";

        "Mod+Shift+Minus".action = set-window-height "-10%";
        "Mod+Shift+Equal".action = set-window-height "+10%";

        "Mod+V".action = toggle-window-floating;
        "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;

        "Print".action.screenshot = [];
        "Ctrl+Print".action.screenshot-screen = [];
        "Alt+Print".action.screenshot-window = [];

        "Mod+Shift+E".action = quit;

        "Mod+Shift+P".action = power-off-monitors;

        # DMS binds
        "Mod+Space".action = spawn ["dms" "ipc" "call" "spotlight" "toggle"];

        "Mod+Escape".action = spawn ["dms" "ipc" "call" "settings" "toggle"];

        "Mod+N".action = spawn ["dms" "ipc" "call" "notifications" "toggle"];

        "Mod+M".action = spawn ["dms" "ipc" "call" "processlist" "toggle"];

        "Mod+Shift+N".action = spawn ["dms" "ipc" "call" "notepad" "toggle"];

        "Mod+Alt+L".action = spawn ["dms" "ipc" "call" "lock" "lock"];

        "XF86AudioRaiseVolume" = {
          action = spawn ["dms" "ipc" "call" "audio" "increment" "3"];
          allow-when-locked = true;
        };
        "XF86AudioLowerVolume" = {
          action = spawn ["dms" "ipc" "call" "audio" "decrement" "3"];
          allow-when-locked = true;
        };

        "XF86AudioMute" = {
          action = spawn ["dms" "ipc" "call" "audio" "mute"];
          allow-when-locked = true;
        };
        "XF86AudioMicMute" = {
          action = spawn ["dms" "ipc" "call" "audio" "micmute"];
          allow-when-locked = true;
        };
      };
    };
  };
}
