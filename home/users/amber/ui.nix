{pkgs, ...}: {
  imports = [
    ./default.nix
    (import ../../modules/hyprland {
      wallpaper = "~/wallpapers/yuri-bike.jpg";
      lock_wallpaper = "~/wallpapers/poly4.png";
    })
    ../../modules/apps
    ../../modules/apps/spotify.nix
    ../../modules/apps/discord.nix
    ../../modules/apps/music_library.nix
    ../../modules/sunshine.nix
  ];

  xdg.userDirs.enable = true;

  home.packages = with pkgs; [cockatrice bambu-studio];
}
