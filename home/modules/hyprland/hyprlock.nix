{ lock_wallpaper, ... }:
{...}:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        monitor = "";
        path = lock_wallpaper;
      };
      input-field = {
        monitor = "";
        size = "250, 50";
        halign = "center";
        valign = "center";
        position = "0, -80";
        dots_center = true;
        fade_on_empty = false;
        font_color = "rgb(202, 211, 245)";
        inner_color = "rgb(91, 96, 120)";
        outer_color = "rgb(24, 25, 38)";
        outline_thickness = 5;
        shadow_passes = 2;
      };
    };
  };

  wayland.windowManager.hyprland.settings.bind = [
    "SUPER CTRL,Q,exec,hyprlock"
  ];
}
