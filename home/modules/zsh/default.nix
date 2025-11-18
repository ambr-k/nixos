{pkgs, ...}: {
  imports = [
    ./bat.nix
    ./btop.nix
    ./eza.nix
    ./fzf.nix
    ./lazygit.nix
    ./nixtools.nix
    ./starship.nix
    ./yazi.nix
    ./zoxide.nix
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
    };
  };
  home.sessionPath = ["$HOME/.local/bin"];

  home.packages = with pkgs; [dig tree];
  programs.zellij.enable = true;
  programs.less.enable = true;
  programs.ripgrep.enable = true;
}
