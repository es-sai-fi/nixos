{pkgs}:
pkgs.symlinkJoin {
  name = "fish-wrapped";
  paths = [pkgs.fish];
  buildInputs = [pkgs.makeWrapper];
  postBuild = ''
    mkdir $out/fish
    ln -s ${./functions} $out/fish/functions

    wrapProgram $out/bin/fish \
      --set XDG_CONFIG_HOME $out
  '';
}
