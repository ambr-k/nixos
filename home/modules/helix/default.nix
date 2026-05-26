{...}: {
  imports = [
    ./nixd.nix
  ];

  programs.helix = {
    enable = true;
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
          auto-signature-help = false;
        };

        inline-diagnostics = {
          cursor-line = "hint";
        };
      };

      keys.normal."["."[" = ":buffer-previous";
      keys.normal."]"."]" = ":buffer-next";
      keys.normal."ret" = "goto_word";
      keys.normal."=" = ":format";
      keys.normal."+" = "format_selections";
      keys.normal."\\" = {
        "backspace" = ":bc";
        "b" = ":sh git blame -L %{cursor_line},%{cursor_line} %{buffer_name} && echo '---' && git blame -L %{cursor_line},%{cursor_line} %{buffer_name} --incremental | grep '^summary'";
        "p" = [":n" ":insert-output poetry install" ":bc!" ":lsp-restart"];
      };
      keys.normal."space" = {
        # extend select to include next occurence
        "n" = ["search_selection_detect_word_boundaries" "extend_search_next"];
        # select all occurences
        "N" = "@*%s<up><ret>";
        # select whole word
        "m" = "@miw";
      };

      keys.insert."C-space" = "signature_help";
    };
  };
}
