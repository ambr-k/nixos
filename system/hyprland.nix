{
  inputs,
  system,
  ...
}: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages.${system}.hyprland;
    portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
  };
  services.greetd.enable = true;
  programs.regreet = {
    enable = true;
    settings.GTK.application_prefer_dark_theme = true;
  };
}
