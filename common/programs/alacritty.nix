{pkgs, ...}: let
  alacrittyWrapped = import ../wrappers/alacritty.nix {
    inherit pkgs;
  };
in {
  environment.systemPackages = [alacrittyWrapped];
}
