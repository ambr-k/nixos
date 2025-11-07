{
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    shellAliases = {
      ls = "eza";
      ll = "ls -l";
      lg = "lazygit";
      cd = "z";
      ".." = "cd ..";
      "..." = "cd ../..";
      code = "hx";
      nixopts = ''manix "" | grep '^# ' | sed 's/^# \(.*\) (.*/\1/;s/ (.*//;s/^# //' | fzf --preview="manix '{}'"'';
      nixrb = "nh os switch --ask";
    };
  };
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.starship.enable = true;
  xdg.configFile."starship.toml".source = lib.mkForce ./config/starship.toml;

  programs.helix.enable = true;
  xdg.configFile."helix/config.toml".source = lib.mkForce ./config/helix.toml;

  programs.zoxide.enable = true;
  programs.fzf.enable = true;

  programs.ripgrep.enable = true;
  programs.lazygit.enable = true;
  programs.eza.enable = true;

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "dracula";
      vim_keys = true;
    };
  };

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 3d --keep 5";
    };
    flake = "/etc/nixos";
  };

  home.packages = with pkgs; [
    alejandra
    manix
  ];

  home.file.".local/bin/nixcommit" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      # https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5
      set -e
      pushd /etc/nixos
      alejandra . &>/dev/null || (alejandra . ; echo "Formatting failed, exiting." && popd && exit 1)
      git diff -U0
      nh os switch --ask
      [[ -v 1 ]] && (git commit -am "$1" && echo "Git Commit Successful") || echo "No Git Commit"
      popd
      echo "Rebuild Succeeded: ''${1:-$(nixos-rebuild list-generations | grep current)}"
      notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available
    '';
  };
}
