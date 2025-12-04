{pkgs, ...}: {
  programs.zsh.shellAliases = {
    nixopts = ''manix "" | grep '^# ' | sed 's/^# \(.*\) (.*/\1/;s/ (.*//;s/^# //' | fzf --preview="manix '{}'"'';
    nixrb = "nh os switch --ask";
  };

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 3d --keep 5";
    };
    flake = "path:/etc/nixos";
  };

  home.packages = with pkgs; [
    alejandra
    manix
    nixd
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
      command -v notify-send >/dev/null && notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available || true
    '';
  };
}
