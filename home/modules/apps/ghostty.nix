{...}: {
  programs.ghostty = {
    enable = true;

    settings = {
      font-family = "AporeticSerifMono Nerd Font";
      font-size = 14;
      window-padding-x = 5;
      window-padding-y = 5;
      window-padding-balance = true;

      keybind = "global:super+tab=toggle_quick_terminal";
      quick-terminal-position = "right";
      quick-terminal-size = "25%";
    };
  };
}
