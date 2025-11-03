{...}:
{
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;
  services.greetd.enable = true;
  programs.regreet = {
    enable = true;
    settings.GTK.applicatiion_prefer_dark_theme = true;
  };
}
