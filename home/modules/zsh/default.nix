{
  pkgs,
  lib,
  ...
}: {
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
    syntaxHighlighting.enable = true;

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
    };

    initContent = lib.mkAfter ''
      eval "$INITCMD";

      function Resume {
        zle push-input
        fg
        zle get-line
        zle redisplay
      }
      zle -N Resume
      bindkey "^Z" Resume
    '';
  };
  home.sessionPath = ["$HOME/.local/bin"];

  home.packages = with pkgs; [dig tree duf chafa];
  programs.zellij.enable = true;
  programs.less.enable = true;
  programs.ripgrep.enable = true;
}
