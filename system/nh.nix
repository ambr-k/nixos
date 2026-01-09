{pkgs-unstable, ...}: {
  disabledModules = ["programs/nh.nix"];
  imports = ["${pkgs-unstable.path}/nixos/modules/programs/nh.nix"];

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
