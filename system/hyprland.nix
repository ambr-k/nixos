{
  pkgs,
  inputs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  services.greetd.enable = true;
  programs.regreet = {
    enable = true;
    settings.GTK.application_prefer_dark_theme = true;
  };
}
