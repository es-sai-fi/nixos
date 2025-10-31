{ pkgs, ... }:
{
  users.users.es-sai-fi = {
    isNormalUser = true;
    description = "es-sai-fi";
    extraGroups = [
      "networkmanager"
      "wheel"
      "podman"
    ];
    packages = with pkgs; [ ];
  };

  home-manager.users.es-sai-fi =
    { pkgs, ... }:
    {
      xdg.mimeApps = {
        enable = true;
        defaultApplications = {
          "text/html" = "librewolf.desktop";
          "x-scheme-handler/http" = "librewolf.desktop";
          "x-scheme-handler/https" = "librewolf.desktop";
          "x-scheme-handler/about" = "librewolf.desktop";
          "x-scheme-handler/unknown" = "librewolf.desktop";
          "application/pdf" = "librewolf.desktop";
        };
      };

      home.packages = with pkgs; [
        wl-clipboard
        wlsunset
        swaybg
        waybar
        statix
        nixfmt
      ];

      dconf.settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
      };

      programs = {
        fzf.enable = true;
        ripgrep.enable = true;
        eza.enable = true;
        alacritty.enable = true;
        zellij.enable = true;
        fuzzel.enable = true;
      };

      services = {
        mako.enable = true;
      };

      home.stateVersion = "25.05";
    };
}
