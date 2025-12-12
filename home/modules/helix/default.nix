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
      keys.normal."\\" = {
        "backspace" = ":bc";
        "b" = ":sh git blame -L %{cursor_line},%{cursor_line} %{buffer_name} && echo '---' && git blame -L %{cursor_line},%{cursor_line} %{buffer_name} --incremental | grep '^summary'";
        "p" = [":n" ":insert-output poetry install" ":bc!" ":lsp-restart"];
      };
    };
  };
}
