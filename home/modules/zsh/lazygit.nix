{...}: {
  programs.lazygit = {
    enable = true;
    settings = {
      disableStartupPopups = true;
      promptToReturnFromSubprocess = false;
      gui.nerdFontsVersion = "3";
    };
  };
  programs.zsh.shellAliases.lg = "lazygit";
}
