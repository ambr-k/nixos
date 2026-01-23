{lib, ...}: {
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
    extraConfig.credential.helper = lib.mkForce ["cache --timeout 21600" "oauth"];
    extraConfig.credential."https://github.gatech.edu" = {
      oauthClientId = "0120e057bd645470c1ed";
      oauthClientSecret = "18867509d956965542b521a529a79bb883344c90";
      oauthRedirectUrl = "http://localhost/";
    };
  };
  programs.git-credential-oauth.enable = true;

  home.stateVersion = "25.05";
}
