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
      };
    };
  };
}
