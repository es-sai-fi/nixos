{pkgs}: let
  niriConfigFile = builtins.readFile "./config.kdl";
in
  pkgs.symlinkJoin {
    name = "niri-wrapped";
    paths = [pkgs.niri];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      mkdir $out/niri
      cp ${niriConfigFile} $out/niri/config.kdl

      wrapProgram $out/bin/niri \
        --set NIRI_CONFIG $out/niri
    '';
  }
