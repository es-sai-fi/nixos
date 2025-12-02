{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    functions = {
      _fzf_compgen_path = {
        body = ''
          fd --hidden --exclude .git . $argv[1]
        '';
      };

      _fzf_compgen_dir = {
        body = ''
          fd --type d --hidden --exclude .git . $argv[1]
        '';
      };
      update = {
        body = ''
          nix flake update --flake ~/Projects/neovim-flake/
          git -C ~/Projects/neovim-flake/ add flake.lock
          git -C ~/Projects/neovim-flake/ commit -m "chore: nix flake update"
          git -C ~/Projects/neovim-flake/ push

          nix flake update --flake ~/Projects/nixfiles/
          sudo nixos-rebuild switch --flake ~/Projects/nixfiles/
          git -C ~/Projects/nixfiles add flake.lock
          git -C ~/Projects/nixfiles commit -m "chore: nix flake update"
          git -C ~/Projects/nixfiles push
        '';
      };
      rebuild = {
        body = ''
          sudo nixos-rebuild switch --flake ~/Projects/nixfiles/
        '';
      };
      clean = {
        body = ''
          sudo nix-collect-garbage -d
          sudo nix store optimise
          nix-collect-garbage -d
          nix store optimise
        '';
      };
      dev_container = {
        body = ''
          set port 5173
          if test (count $argv) -ge 1
            set port $argv[1]
          end

          podman run \
            --userns=keep-id \
            -it \
            --rm \
            -v (pwd):/home/devuser/workspace \
            -w /home/devuser/workspace \
            -p $port:$port \
            ghcr.io/es-sai-fi/dev:latest
        '';
      };
      fish_user_key_bindings = {
        body = ''
          if command -s fzf-share >/dev/null
              source (fzf-share)/key-bindings.fish
          end

          fzf_key_bindings
        '';
      };
    };
  };
}
