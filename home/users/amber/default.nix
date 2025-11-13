{...}: {
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
  };

  home.stateVersion = "25.05";
}
