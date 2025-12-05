{pkgs, ...}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = pkgs.helix;
    extraPackages = with pkgs; [
      alejandra
      nil
      statix
      lua-language-server
      stylua
      basedpyright
      ruff
      typescript-language-server
      biome
      rust-analyzer
      clippy
      rustfmt
      golangci-lint
      gopls
      gofumpt
      clang-tools
    ];
    languages = {
      language-server = {
        statix = {
          command = "statix";
          args = ["check"];
        };
        gopls.config.gofumpt = true;
      };
      language = [
        {
          name = "nix";
          language-servers = ["nil" "statix"];
          formatter.command = "alejandra";
        }
        {
          name = "python";
          language-servers = ["basedpyright" "ruff"];
        }
      ];
    };
    settings = {
      theme = "gruvbox_dark_soft";
      editor = {
        line-number = "relative";
        mouse = true;
        middle-click-paste = false;
        color-modes = true;
        true-color = true;
        auto-pairs = true;
        scrolloff = 10;
        bufferline = "multiple";
        end-of-line-diagnostics = "hint";
        clipboard-provider = "wayland";
        lsp.display-messages = true;
        auto-format = true;
        rulers = [80];
        shell = ["fish" "-c"];
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
          raimbow = "normal";
        };
        rainbow-brackets = true;
        inline-diagnostics = {
          cursor-line = "hint";
        };
        gutters = ["diagnostics" "line-numbers" "spacer" "diff"];
        statusline = {
          left = ["mode" "selections" "spinner" "file-name" "total-line-numbers"];
          center = [];
          right = ["diagnostics" "file-encoding" "file-line-ending" "file-type" "position-percentage" "position"];
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
