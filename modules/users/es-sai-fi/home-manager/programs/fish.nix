{

  fish = {
    enable = true;
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
        body = "sudo nixos-rebuild switch --flake ~/nixfiles/";
      };
      clean = {
        body = ''
          sudo nix-collect-garbage -d
          sudo nix-store --gc
          sudo nix-store --optimise
          nix-collect-garbage -d
          nix-store --gc
          nix-store --optimise
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
