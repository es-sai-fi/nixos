{pkgs, ...}: let
  fzfWrapped = import ../wrappers/fzf.nix {inherit pkgs;};
in {
  environment.systemPackages = [fzfWrapped];
}
