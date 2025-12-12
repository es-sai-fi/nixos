{pkgs}:
pkgs.symlinkJoin {
  name = "niri-wrapped";
  paths = [pkgs.niri];
  buildInputs = [pkgs.makeWrapper];
  postBuild = ''
    mkdir $out/niri
    cp ${./config.kdl} $out/niri/config.kdl

    wrapProgram $out/bin/niri \
      --set NIRI_CONFIG $out/niri
  '';
  meta.mainProgram = "niri";
}
