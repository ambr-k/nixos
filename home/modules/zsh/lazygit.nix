{...}: {
  programs.lazygit.enable = true;
  programs.lazygit.settings.disableStartupPopups = true;
  programs.zsh.shellAliases.lg = "lazygit";
}
