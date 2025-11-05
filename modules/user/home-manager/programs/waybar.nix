{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;

        modules-left = [ "niri/workspaces" ];
        modules-center = [ "niri/window" ];
        modules-right = [
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "temperature"
          "clock"
          "tray"
        ];

        tray = {
          spacing = 10;
        };

        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };

        cpu = {
          format = "{usage}% ";
          tooltip = true;
        };

        memory = {
          format = "{}% ";
        };

        temperature = {
          hwmon-path = "/sys/class/hwmon/hwmon1/temp3_input";
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = [
            ""
            ""
            ""
          ];
        };

        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            "hands-free" = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
        };
      };
    };

    style = ''
      * {
          font-family: JetBrainsMono Nerd Font;
          font-size: 13px;
      }

      window#waybar {
          background-color: rgba(30, 30, 35, 0.9);
          border-bottom: 2px solid rgba(60, 60, 70, 0.5);
          color: #ffffff;
          transition: background-color 0.3s;
      }

      window#waybar.hidden { opacity: 0.2; }

      button {
          box-shadow: inset 0 -3px transparent;
          border: none;
          border-radius: 0;
          transition: background-color 0.2s;
      }

      button:hover {
          background-color: rgba(255, 255, 255, 0.05);
          box-shadow: inset 0 -3px #ffffff;
      }

      #workspaces button {
          padding: 0 5px;
          background-color: transparent;
          color: #ffffff;
      }

      #workspaces button:hover { background: rgba(255, 255, 255, 0.1); }
      #workspaces button.focused { background-color: #4a4f57; box-shadow: inset 0 -3px #ffffff; }
      #workspaces button.urgent { background-color: #e74c3c; }

      #mode { background-color: #4a4f57; box-shadow: inset 0 -3px #ffffff; }

      #clock, #battery, #cpu, #memory, #disk, #temperature, #backlight, #network,
      #pulseaudio, #wireplumber, #custom-media, #tray, #idle_inhibitor,
      #scratchpad, #power-profiles-daemon, #mpd, #language, #keyboard-state {
          padding: 0 10px;
          color: #ffffff;
          background-color: #2f3136;
          transition: background-color 0.2s;
      }

      #temperature.critical { background-color: #e74c3c; }
      #network.disconnected { background-color: #e74c3c; }

      #pulseaudio.muted { background-color: #555759; color: #ffffff; }
      #wireplumber.muted { background-color: #e74c3c; color: #ffffff; }

      #idle_inhibitor.activated { background-color: #555759; color: #ffffff; }

      #mpd.disconnected { background-color: #e74c3c; }
      #mpd.stopped { background-color: #555759; }
      #mpd.paused { background-color: #4a4f57; }

      #scratchpad { background: rgba(40, 40, 40, 0.3); }
      #scratchpad.empty { background-color: transparent; }

      #privacy-item.screenshare { background-color: #b3472f; }

      #cpu:hover, #memory:hover, #disk:hover, #temperature:hover:not(.critical),
      #backlight:hover, #network:hover:not(.disconnected),
      #pulseaudio:hover:not(.muted), #wireplumber:hover:not(.muted),
      #custom-media:hover, #tray:hover, #idle_inhibitor:hover:not(.activated),
      #mpd:hover:not(.disconnected):not(.stopped):not(.paused),
      #language:hover, #keyboard-state:hover {
          background-color: rgba(70, 70, 70, 0.8);
      }
    '';
  };
}
