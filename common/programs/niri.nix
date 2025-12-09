{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.niri-flake.nixosModules.niri];

  nixpkgs.overlays = [
    inputs.niri-flake.overlays.niri
  ];

  environment.systemPackages = with pkgs; [
    nautilus
  ];

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

  hjem.users.es-sai-fi.rum.desktops.niri = {
    enable = true;
    binds = {};
    config = {};
  };
}
