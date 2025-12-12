{
  lib,
  pkgs,
}: let
  yaziWrapped = import ../wrappers/yazi {inherit pkgs lib;};
in {
  environment.systemPackages = [yaziWrapped];
}
