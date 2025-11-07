{pkgs, ...}: {
  home.packages = [pkgs.hyprshot];
  wayland.windowManager.hyprland.settings.bind = [
    "SUPER,S,exec,hyprshot -m region"
    "SUPER CTRL,S,exec,hyprshot -m window"
  ];
}
