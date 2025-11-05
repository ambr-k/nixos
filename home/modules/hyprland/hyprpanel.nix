{...}:
{
  programs.hyprpanel.enable = true;
  xdg.configFile."hyprpanel/config.json".source = ./config/hyprpanel.json;
  xdg.configFile."hyprpanel/modules.scss".text = ".bar-button-icon.media {font-size: 0px;}";
  wayland.windowManager.hyprland.settings.exec-once = ["hyprpanel"];
}
