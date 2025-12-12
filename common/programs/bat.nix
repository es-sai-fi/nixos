{pkgs}: let
  batWrapped = import ../wrappers/bat.nix {inherit pkgs;};
in {
  environment.variables = {
    PAGER = "bat";
  };

  programs.bat = {
    enable = true;
    package = batWrapped;
  };
}
