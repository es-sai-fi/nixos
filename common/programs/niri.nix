{pkgs}: let
  niriWrapped = import ../wrappers/niri {inherit pkgs;};
in {
  environment.systemPackages = with pkgs; [
    nautilus
    xwayland-satellite
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
    package = niriWrapped;
  };
}
