{ wallpaper, ... }:
{...}:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      wallpaper = ", ${wallpaper}";
      preload = wallpaper;
    };
  };
  wayland.windowManager.hyprland.settings.exec-once = ["hyprpaper"];
}
