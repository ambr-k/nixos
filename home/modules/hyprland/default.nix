{...} @ hyprland_params: {...}: {
  imports = [
    ./hyprland.nix
    ./hypridle.nix
    ./hyprpanel.nix
    ./hyprscrolling.nix
    ./hyprshot.nix
    (import ./hyprlock.nix hyprland_params)
    (import ./hyprpaper.nix hyprland_params)
    ./swayosd.nix
    ./vicinae.nix
  ];
}
