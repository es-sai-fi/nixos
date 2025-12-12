{pkgs}: let
  tealdeerWrapped = import ../wrappers/tealdeer.nix {inherit pkgs;};
in {
  environment.systemPackages = [tealdeerWrapped];
}
