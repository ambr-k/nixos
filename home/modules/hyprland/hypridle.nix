{pkgs, ...}: {
  home.packages = [pkgs.hypridle];
  wayland.windowManager.hyprland.settings.exec-once = ["hypridle"];
  xdg.configFile."hypr/hypridle.conf".source = ./config/hypridle.conf;
}
