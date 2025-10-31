{
  services = {
    gnome.gnome-keyring.enable = true;
    flatpak.enable = true;
    getty.autologinUser = "es-sai-fi";
    xserver.xkb = {
      layout = "es";
      variant = "";
    };
  };
}
