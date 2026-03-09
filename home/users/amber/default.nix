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
    settings = {
      user = {
        name = "Amber Kirschbaum";
        email = "amber.fae.k@gmail.com";
      };
      credential = {
        helper = lib.mkForce [
          "manager"
        ];
        credentialStore = "secretservice";
      };
    };
  };
  home.packages = [pkgs.git-credential-manager];

  home.stateVersion = "25.05";
}
