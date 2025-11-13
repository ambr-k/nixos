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

    initContent = lib.mkAfter ''
      _fzf_comprun() {
        local command=$1
        shift

        case "$command" in
          cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
          export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
          ssh)          fzf --preview 'dig {}'                   "$@" ;;
          *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
        esac
      }
    '';
  };
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.packages = with pkgs; [dig];

  programs.starship.enable = true;
  xdg.configFile."starship.toml".source = lib.mkForce ./config/starship.toml;

  programs.helix.enable = true;
  programs.helix.defaultEditor = true;
  programs.helix.settings = pkgs.lib.importTOML ./config/helix.toml;

  programs.zoxide.enable = true;
  programs.fzf.enable = true;
  programs.zellij.enable = true;
  programs.yazi.enable = true;
  programs.yazi.theme.flavor.dark = "rose-pine-moon";
  programs.yazi.flavors.rose-pine-moon = let
    repo = pkgs.fetchFromGitHub {
      owner = "rose-pine";
      repo = "yazi";
      rev = "fd385266af5f3419657e449607f3e87f062d0d2e";
      sha256 = "3j7TTtzG+GCB4uVeCiuvb/0dCkHPz7X+MDBVVUp646A=";
    };
  in "${repo}/flavors/rose-pine-moon.yazi";
  programs.bat.enable = true;
  programs.bat.themes = {
    rose-pine-moon = {
      src = pkgs.fetchFromGitHub {
        owner = "rose-pine";
        repo = "tm-theme";
        rev = "417d201beb5f0964faded5448147c252ff12c4ae";
        sha256 = "aNDOqY81FLFQ6bvsTiYgPyS5lJrqZnFMpvpTCSNyY0Y=";
      };
      file = "dist/rose-pine-moon.tmTheme";
    };
  };
  programs.bat.config.theme = "rose-pine-moon";
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
