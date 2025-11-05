{...}: {
  services.swayosd.enable = true;
  wayland.windowManager.hyprland.settings.bindl = [
    ",XF86AudioRaiseVolume,exec,swayosd-client --output-volume raise"
    ",XF86AudioLowerVolume,exec,swayosd-client --output-volume lower"
    ",XF86AudioMute,exec,swayosd-client --output-volume mute-toggle"
  ];
}
