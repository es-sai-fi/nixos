{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
  };

  hjem.users.es-sai-fi.xdd.config.files = {
    "fish/functions/update.fish" = {
      text = ''
        function update
            nix flake update --flake ~/Projects/neovim-flake/
            git -C ~/Projects/neovim-flake/ add flake.lock
            git -C ~/Projects/neovim-flake/ commit -m "chore: nix flake update"
            git -C ~/Projects/neovim-flake/ push

            nix flake update --flake ~/Projects/nixfiles/
            sudo nixos-rebuild switch --flake ~/Projects/nixfiles/
            git -C ~/Projects/nixfiles add flake.lock
            git -C ~/Projects/nixfiles commit -m "chore: nix flake update"
            git -C ~/Projects/nixfiles push
        end
      '';
    };
    "fish/functions/rebuild.fish" = {
      text = ''
        function update
            sudo nixos-rebuild switch --flake ~/Projects/nixfiles/
        end
      '';
    };
    "fish/functions/clean.fish" = {
      text = ''
         function clean
            sudo nix-collect-garbage -d
            sudo nix store optimise
            nix-collect-garbage -d
            nix store optimise
        end
      '';
    };
  };
}
