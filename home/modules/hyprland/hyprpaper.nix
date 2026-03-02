{wallpaper, ...}: {...}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      wallpaper = {
        monitor = "";
        path = wallpaper;
      };
    };
  };
  wayland.windowManager.hyprland.settings.exec-once = ["hyprpaper"];
}
