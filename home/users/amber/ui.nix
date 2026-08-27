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
    ../../modules/apps/steam.nix
    ../../modules/sunshine.nix
    ../../modules/kdeconnect.nix
  ];

  xdg.userDirs.enable = true;

  home.packages = with pkgs; [cockatrice bambu-studio pcsx2 onlyoffice-desktopeditors gparted-full obs-studio];
}
