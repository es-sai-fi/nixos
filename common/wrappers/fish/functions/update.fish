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
