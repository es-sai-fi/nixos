{pkgs, ...}: let
  gitWrapped = import ../wrappers/git.nix {
    inherit pkgs;
  };
in {
  environment.systemPackages = [gitWrapped];
}
