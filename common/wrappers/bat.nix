{pkgs}:
pkgs.symlinkJoin {
  name = "bat-wrapped";
  paths = [pkgs.bat];
  buildInputs = [pkgs.makeWrapper];
  postBuild = ''
    wrapProgram $out/bin/bat \
      --set BAT_THEME gruvbox-dark \
      --set BAT_PAGER builtin
  '';
  meta.mainProgram = "bat";
}
