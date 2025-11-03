{...}:
{
  programs.hyprpanel.enable = true;
  xdg.configFile."hyprpanel/config.json".source = ./config/hyprpanel.json;
  wayland.windowManager.hyprland.settings.exec-once = ["hyprpanel"];
}
