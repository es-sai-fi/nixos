{pkgs}: let
  bottomWrapped = import ../wrappers/bottom.nix {inherit pkgs;};
in {
  environment.systemPackages = [bottomWrapped];
}
