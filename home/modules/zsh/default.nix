{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./bat.nix
    ./btop.nix
    ./direnv.nix
    ./eza.nix
    ./fzf.nix
    ./git-crypt.nix
    ./lazygit.nix
    ./nixtools.nix
    ./starship.nix
    ./widgets.nix
    ./yazi.nix
    ./zoxide.nix
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
    };

    initContent = lib.mkAfter ''
      eval "$INITCMD";

      unsetopt share_history
    '';
  };
  home.sessionPath = ["$HOME/.local/bin"];

  home.packages = with pkgs; [dig tree duf chafa];
  programs.zellij.enable = true;
  xdg.configFile."zellij/config.kdl".source = ./config/zellij.kdl;
  programs.less.enable = true;
  programs.ripgrep.enable = true;
}
