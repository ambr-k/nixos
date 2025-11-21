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
  programs.zsh.shellAliases.lg = "lazygit";
}
