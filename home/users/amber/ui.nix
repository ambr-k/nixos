{...}: {
  imports = [
    ./default.nix
    (import ../../modules/hyprland {
      wallpaper = "~/wallpapers/yuri-bike.jpg";
      lock_wallpaper = "~/wallpapers/poly4.png";
    })
    ../../modules/hyprland/start_locked.nix
    ../../modules/apps
    ../../modules/apps/spotify.nix
    ../../modules/apps/discord.nix
  ];
}
