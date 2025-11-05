{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "tokyo-night-storm";
      default_shell = "fish";
      show_startup_tips = false;
    };
    layouts = {
      dev = {
        layout = ''
          layout {
              pane split_direction="vertical" {
                  pane
                  pane split_direction="horizontal" {
                      pane
                      pane
                  }
              }
          }
        '';
      };
    };
  };
}
