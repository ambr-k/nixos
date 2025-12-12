{...}: {
  programs.eza.enable = true;
  programs.zsh.shellAliases = {
    ls = "eza --icons=auto -h --group-directories-first";
    ll = "ls -l";
  };
}
