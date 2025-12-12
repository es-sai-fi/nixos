{
  pkgs,
  niri,
}: let
  niriWrapped = import ../wrappers/niri.nix {inherit pkgs;};
in {
  imports = [niri.nixosModules.niri];

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
    package = niriWrapped;
  };
}
