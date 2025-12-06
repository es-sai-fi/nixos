{pkgs, ...}: {
  programs.helix = {
    enable = true;
    useDefaultEditor = true;
    package = pkgs.helix;
    extraPackages = with pkgs; [
      # Debugger
      lldb

      # Nix
      alejandra
      nil
      statix

      # Lua
      lua-language-server
      stylua

      # Python
      basedpyright
      ruff

      # JavaScript/TypeScript
      typescript-language-server
      biome

      # Rust
      rust-analyzer
      clippy
      rustfmt

      # Go
      go
      golangci-lint
      gopls
      gofumpt

      # C/C++
      clang-tools
    ];

    languages = {
      language-server = {
        statix = {
          command = "statix";
          args = ["check"];
        };
      };

      language = [
        {
          name = "nix";
          language-servers = ["nil" "statix"];
          auto-format = true;
          formatter = {command = "alejandra";};
        }
        {
          name = "rust";
          auto-format = true;
          formatter = {command = "rustfmt";};
        }
        {
          name = "go";
          auto-format = true;
          formatter = {command = "gofumpt";};
        }
        {
          name = "python";
          language-servers = ["basedpyright" "ruff"];
          auto-format = true;
          formatter = {
            command = "ruff";
            args = ["format"];
          };
        }
        {
          name = "javascript";
          auto-format = true;
          formatter = {
            command = "biome";
            args = ["format" "--write"];
          };
        }
        {
          name = "typescript";
          auto-format = true;
          formatter = {
            command = "biome";
            args = ["format" "--write"];
          };
        }
        {
          name = "json";
          auto-format = true;
          formatter = {
            command = "biome";
            args = ["format" "--write"];
          };
        }
        {
          name = "jsonc";
          auto-format = true;
          formatter = {
            command = "biome";
            args = ["format" "--write"];
          };
        }
        {
          name = "lua";
          auto-format = true;
          formatter = {
            command = "stylua";
            args = ["-"];
          };
        }
      ];
    };

    settings = {
      theme = "gruvbox_dark_soft";

      editor = {
        line-number = "relative";
        mouse = true;
        middle-click-paste = false;
        scrolloff = 10;
        rulers = [80];
        auto-pairs = false;
        auto-format = true;
        true-color = true;
        color-modes = true;
        clipboard-provider = "wayland";

        shell = ["fish" "-c"];

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

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

        indent-guides = {
          render = true;
        };
        rainbow-brackets = true;

        file-picker = {
          hidden = false;
        };

        lsp = {
          display-inlay-hints = true;
        };

        end-of-line-diagnostics = "hint";
        inline-diagnostics = {
          cursor-line = "warning";
        };

        statusline = {
          left = ["mode" "spinner" "version-control" "read-only-indicator" "file-modification-indicator"];
          center = ["file-name"];
          right = ["diagnostics" "file-type" "position-percentage" "position"];

          mode = {
            normal = "NOR";
            insert = "INS";
            select = "SEL";
          };

          diagnostics = ["warning" "error"];
          workspace-diagnostics = ["warning" "error"];
        };
      };

      keys = {
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

        select = {
          d = ["yank_joined_to_clipboard" "delete_selection"];
          c = "change_selection_noyank";
          R = "replace_selections_with_clipboard";
          p = "paste_clipboard_before";
          P = "paste_clipboard_after";
          y = ["yank" "yank_joined_to_clipboard"];
        };
      };
    };
  };
}
