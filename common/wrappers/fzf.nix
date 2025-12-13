{pkgs}:
pkgs.symlinkJoin {
  name = "fzf-wrapped";
  paths = [pkgs.fzf];
  buildInputs = [pkgs.makeWrapper];
  postBuild = ''
    wrapProgram $out/bin/fzf \
      --set FZF_DEFAULT_COMMAND "fd --type f --color always --exclude .git" \
      --set FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND" \
      --set FZF_ALT_C_COMMAND "fd --type d --color always --exclude .git"
  '';
  meta.mainProgram = "fzf";
}
