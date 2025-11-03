{lib, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    shellAliases = {
      ll = "ls -l";
      cd = "z";
      code = "hx";
      update = "sudo nixos-rebuild switch";
    };
  };

  programs.starship.enable = true;
  xdg.configFile."starship.toml".source = lib.mkForce ./config/starship.toml;

  programs.helix.enable = true;
  xdg.configFile."helix/config.toml".source = lib.mkForce ./config/helix.toml;

  programs.zoxide.enable = true;
  programs.fzf.enable = true;
}
