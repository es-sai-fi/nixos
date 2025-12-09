{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    download-buffer-size = 134217728;
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
}
