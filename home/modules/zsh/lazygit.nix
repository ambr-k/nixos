{...}: {
  programs.lazygit = {
    enable = true;
    settings = {
      disableStartupPopups = true;
      promptToReturnFromSubprocess = false;
      gui.nerdFontsVersion = "3";
      gui.scrollPastBottom = false;
    };
  };
  # ensure git credential cache is running since lazygit can't start the cache itself
  programs.zsh.shellAliases.lg = "lazygit";
}
