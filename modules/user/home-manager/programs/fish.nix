{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      ls = "eza";
      cd = "z";
      find = "fd";
      cat = "bat";
      grep = "rg";
    };
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
      poweroff = {
        body = "systemctl poweroff";
      };
      reboot = {
        body = "systemctl reboot";
      };
      update = {
        body = ''
          nix flake update --flake ~/nixfiles/
          sudo nixos-rebuild switch --flake ~/nixfiles/
          git add flake.lock
          git commit -m "chore: nix flake update"
          git push
        '';
      };
      rebuild = {
        body = ''
          sudo nixos-rebuild switch --flake ~/nixfiles/
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
      generations = {
        body = ''
          echo "System-wide genations:"
          sudo nix-env --list-generations --profile /nix/var/nix/profiles/system
          echo "User generations:"
          nix-env --list-generations
        '';
      };
      dev = {
        body = ''
          if test (count $argv) -eq 0
              echo "Usage: dev <flake-target> (e.g. #rust, #python)"
              return 1
          end

          set target $argv[1]

          nix develop ~/nixfiles/shell#$target
        '';
      };
      roblox = {
        body = "flatpak run org.vinegarhq.Sober";
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
