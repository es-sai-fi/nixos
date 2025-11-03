{
  services = {
    #gnome.gnome-keyring.enable = true;
    flatpak.enable = true;
    getty.autologinUser = "es-sai-fi";
    xserver.xkb = {
      layout = "es";
      variant = "";
    };
    pipewire = {
      enable = true;
      audio.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
}
