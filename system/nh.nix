{...}: {
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 3d --keep 5";
    };
    flake = "path:/etc/nixos";
  };
}
