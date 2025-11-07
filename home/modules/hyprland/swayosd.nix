{...}: {
  services.swayosd.enable = true;
  wayland.windowManager.hyprland.settings.bindilr = [
    ",XF86AudioRaiseVolume,exec,swayosd-client --output-volume raise"
    ",XF86AudioLowerVolume,exec,swayosd-client --output-volume lower"
    ",XF86AudioMute,exec,swayosd-client --output-volume mute-toggle"
    ",XF86AudioPlay,exec,swayosd-client --playerctl play-pause"
    ",XF86AudioPrev,exec,swayosd-client --playerctl prev"
    ",XF86AudioNext,exec,swayosd-client --playerctl next"
    ",Caps_Lock,exec,swayosd-client --caps-lock"
    ",Num_Lock,exec,swayosd-client --num-lock"
  ];
}
