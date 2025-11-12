{
  lib,
  pkgs,
  ...
}: {
  imports = [./nixtools.nix];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    shellAliases = {
      ls = "eza";
      ll = "ls -l";
      lg = "lazygit";
      cd = "z";
      ".." = "cd ..";
      "..." = "cd ../..";
      code = "hx";
    };
  };
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.starship.enable = true;
  xdg.configFile."starship.toml".source = lib.mkForce ./config/starship.toml;

  programs.helix.enable = true;
  programs.helix.defaultEditor = true;
  programs.helix.settings = pkgs.lib.importTOML ./config/helix.toml;

  programs.zoxide.enable = true;
  programs.fzf.enable = true;
  programs.zellij.enable = true;
  programs.yazi.enable = true;
  programs.bat.enable = true;
  programs.less.enable = true;

  programs.ripgrep.enable = true;
  programs.lazygit.enable = true;
  programs.eza.enable = true;

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "dracula";
      vim_keys = true;
    };
  };
}
