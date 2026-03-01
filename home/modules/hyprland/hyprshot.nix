{pkgs, ...}: {
  home.packages = [pkgs.hyprshot];
  wayland.windowManager.hyprland.settings.bind = [
    "SUPER,S,exec,hyprshot -m region"
    "SUPER SHIFT,S,exec,hyprshot -m region --clipboard-only"
    "SUPER CTRL,S,exec,hyprshot -m window"
    "SUPER CTRL SHIFT,S,exec,hyprshot -m window --clipboard-only"
  ];
}
