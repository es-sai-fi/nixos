{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        name = "es-sai-fi";
        email = "96452903+es-sai-fi@users.noreply.github.com";
      };
      extraConfig = {
        init.defaultBranch = "main";
        color.ui = "auto";
        pull.rebase = "false";
      };
    };
  };
}
