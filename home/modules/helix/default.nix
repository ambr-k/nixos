{pkgs-unstable, ...}: {
  imports = [
    ./nixd.nix
  ];

  programs.helix = {
    enable = true;
    package = pkgs-unstable.helix;
    defaultEditor = true;
    settings = {
      theme = "rose_pine_moon";
      editor = {
        mouse = false;
        line-number = "relative";
        cursorline = true;
        bufferline = "multiple";
        popup-border = "all";
        color-modes = true;

        lsp = {
          display-inlay-hints = true;
        };

        inline-diagnostics = {
          cursor-line = "warning";
        };
      };

      keys.normal."["."[" = ":buffer-previous";
      keys.normal."]"."]" = ":buffer-next";
      keys.normal."ret" = "goto_word";
    };
  };
}
