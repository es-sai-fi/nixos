{
  lib,
  pkgs,
}: let
  yaziWrapped = import ../wrappers/yazi {inherit pkgs lib;};
in {
  programs.yazi = {
    enable = true;
    package = yaziWrapped;
  };
}
