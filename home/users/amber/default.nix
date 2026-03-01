{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../../modules/zsh
    ../../modules/helix
  ];

  home.username = "amber";
  home.homeDirectory = "/home/amber";

  programs.git = {
    enable = true;
    userName = "Amber Kirschbaum";
    userEmail = "amber.fae.k@gmail.com";
    extraConfig.credential.helper = lib.mkForce [
      "cache --timeout 172800"
      "manager"
    ];
    extraConfig.credential.credentialStore = "cache";
  };
  home.packages = [pkgs.git-credential-manager];

  home.stateVersion = "25.05";
}
