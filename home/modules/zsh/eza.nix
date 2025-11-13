{...}: {
  programs.eza.enable = true;
  programs.zsh.shellAliases = {
    ls = "eza";
    ll = "ls -l";
  };
}
