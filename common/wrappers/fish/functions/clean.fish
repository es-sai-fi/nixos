function clean
    sudo nix-collect-garbage -d
    sudo nix store optimise
    nix-collect-garbage -d
    nix store optimise
end
