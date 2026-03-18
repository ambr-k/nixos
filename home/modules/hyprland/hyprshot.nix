{pkgs, ...}: {
  home.packages = with pkgs; [hyprshot grim slurp swappy wl-clipboard];
  wayland.windowManager.hyprland.settings.bind = [
    "SUPER,S,exec, grim -g \"$(slurp)\" - | swappy -f -"
    "SUPER SHIFT,S,exec, grim -g \"$(slurp)\" - | wl-copy"
    "SUPER CTRL,S,exec,hyprshot -m window"
    "SUPER CTRL SHIFT,S,exec,hyprshot -m window --clipboard-only"
  ];
  wayland.windowManager.hyprland.settings.layerrule = ["no_anim on, match:namespace selection"];

  xdg.configFile."swappy/config".text = ''
    [Default]
    save_dir=$HOME/Pictures/Screenshots
    early_exit=true
  '';
}
