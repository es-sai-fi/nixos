{inputs, ...}: {
  programs.helix = {
    enable = true;
    package = inputs.helix.packages.x86_64-linux.helix;
    defaultEditor = true;
    settings = {
      editor = {
        line-number = "relative";
        mouse = true;
        cursorline = true;
        color-modes = true;
        true-color = true;
        auto-pairs = true;
        scrolloff = 10;
        bufferline = "multiple";
        end-of-line-diagnostics = "hint";
        auto-format = true;
        cursorcolumn = true;
        shell = ["fish" "-c"];
        clipboard-provider = "wayland";
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        file-picker = {
          hidden = false;
        };
        indent-guides = {
          render = true;
        };
        inline-diagnostics = {
          cursor-line = "hint";
        };
        statusline = {
          left = ["mode" "spinner"];
          center = ["file-name" "version-control"];
          right = ["diagnostics" "position" "file-type"];
          separator = "│";
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
          diagnostics = ["warning" "error"];
          workspace-diagnostics = ["warning" "error"];
        };
      };
    };
  };
}
