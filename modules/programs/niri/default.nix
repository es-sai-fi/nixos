{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [inputs.niri-flake.overlays.niri];

  nix.settings = {
    substituters = ["https://niri.cachix.org"];
    trusted-public-keys = ["niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="];
  };

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

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  hjem.users.es-sai-fi.xdd.config.files."niri/config.kdl" = {
    source = pkgs.concatText "config.kdl" [
      "spawn-at-startup ${pkgs.xwayland-satellite-unstable}/bin/xwayland-satellite"
      (builtins.readFile ./config.kdl)
    ];
  };
}
