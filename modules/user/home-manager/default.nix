{
  home-manager.users.es-sai-fi = {
    inputs,
    pkgs,
    config,
    ...
  }: {
    imports = [
      ./programs
      ./services
    ];

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

    home = {
      stateVersion = "25.05";
      shell.enableFishIntegration = true;
    };

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
}
