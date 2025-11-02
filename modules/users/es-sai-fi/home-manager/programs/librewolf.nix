{
  programs.librewolf = {
    enable = true;
    settings = {
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = false;
      "pdfjs.pageColorsForeground" = "#DDDDDD";
      "pdfjs.pageColorsBackground" = "#111111";
    };
    policies = {
      DefaultDownloadDirectory = "\${home}/Downloads";
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };
      Preferences = {
        "sidebar.position_start" = true;
        "sidebar.verticalTabs" = true;
        "browser.startup.page" = 3;
      };
    };
  };
}
