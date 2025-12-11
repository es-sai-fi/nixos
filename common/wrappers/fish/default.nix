{pkgs}:
pkgs.symlinkJoin {
  name = "fish-wrapped";
  paths = [pkgs.fish];
  buildInputs = [pkgs.makeWrapper];
  postBuild = ''
    rm -r $out/share/fish/vendor_functions.d
    ln -s ${./functions} $out/share/fish/vendor_functions.d
  '';
}
