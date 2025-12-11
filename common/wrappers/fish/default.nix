{pkgs}:
pkgs.symlinkJoin {
  name = "fish-wrapped";
  path = [pkgs.fish];
  buildInputs = [pkgs.makeWrapper];
  postBuild = ''
    rm -r $out/share/fish/vendor_functions.d
    ln -s ${./functions} $out/share/fish/vendor_functions.d
  '';
}
