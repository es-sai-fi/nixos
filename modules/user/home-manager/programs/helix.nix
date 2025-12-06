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
      keys = {
        select = {
          d = ["yank_joined_to_clipboard" "delete_selection"];
          c = "change_selection_noyank";
          R = "replace_selections_with_clipboard";
          p = "paste_clipboard_before";
          P = "paste_clipboard_after";
          y = ["yank" "yank_joined_to_clipboard"];
        };
        normal = {
          d = ["yank_joined_to_clipboard" "delete_selection"];
          c = "change_selection_noyank";
          R = "replace_selections_with_clipboard";
          p = "paste_clipboard_before";
          P = "paste_clipboard_after";
          y = ["yank" "yank_joined_to_clipboard"];
          space = {
            R = "replace_with_yanked";
            p = "paste_before";
            P = "paste_after";
            y = "yank";
          };
        };
      };
      editor = {
        line-number = "relative";
        mouse = true;
        middle-click-paste = false;
        soft-wrap = {
          enable = true;
          wrap-indicator = "↩ ";
        };
        whitespace = {
          render = {
            space = "all";
            tab = "all";
          };
          characters = {
            space = " ";
            tab = "→";
            tabpad = "·";
          };
        };
        color-modes = true;
        true-color = true;
        auto-pairs = false;
        auto-format = true;
        scrolloff = 10;
        bufferline = {
          show = "multiple";
          context = "minimal";
        };
        end-of-line-diagnostics = "hint";
        clipboard-provider = "wayland";
        rulers = [80 120];
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
          character = "╎";
          render = true;
          raimbow = "normal";
        };
        rainbow-brackets = true;
        inline-diagnostics = {
          cursor-line = "warning";
        };
        lsp = {
          display-inlay-hints = true;
        };
        statusline = {
          left = ["mode" "version-control" "file-modification-indicator"];
          center = ["file-name"];
          right = ["diagnostics" "file-type" "position-percentage" "position"];
          separator = "│";
          mode = {
            normal = "NOR";
            insert = "INS";
            select = "SEL";
          };
          diagnostics = ["warning" "error"];
          workspace-diagnostics = ["warning" "error"];
        };
      };
    };
  };
}
