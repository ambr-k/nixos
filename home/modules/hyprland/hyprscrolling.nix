{ inputs, system, ... }:
{
  wayland.windowManager.hyprland.plugins = [
    inputs.hyprland-plugins.packages.${system}.hyprscrolling
  ];

  wayland.windowManager.hyprland.settings = {
    general.layout = "scrolling";
    plugin.hyprscrolling = {
      column_width = 0.5;
      focus_fit_method = 1;
    };
    bind = [
      # S-hjkl to move focus
      "SUPER,L,layoutmsg, focus r"
      "SUPER,H,layoutmsg, focus l"
      "SUPER,J,layoutmsg, focus d"
      "SUPER,K,layoutmsg, focus u"
      # S-; to center
      "SUPER,SEMICOLON,layoutmsg, togglefit"
      # S-C-hjkl to resize
      "SUPER CTRL,L,layoutmsg, colresize +conf"
      "SUPER CTRL,H,layoutmsg, colresize -conf"
      # S-Sh-hjkl to move columns
      "SUPER SHIFT,L,layoutmsg, swapcol r"
      "SUPER SHIFT,H,layoutmsg, swapcol l"
      # S-C-Sh-hjkl; to move window between columns
      "SUPER CTRL SHIFT,L,layoutmsg, movewindowto r"
      "SUPER CTRL SHIFT,H,layoutmsg, movewindowto l"
      "SUPER CTRL SHIFT,J,layoutmsg, movewindowto d"
      "SUPER CTRL SHIFT,K,layoutmsg, movewindowto u"
      "SUPER CTRL SHIFT,SEMICOLON,layoutmsg, promote"
      # S-C-Sh-`123 to move column to workspace
      "SUPER CTRL SHIFT,Grave,layoutmsg, movecoltoworkspace special"
      "SUPER CTRL SHIFT,1,layoutmsg, movecoltoworkspace 1"
      "SUPER CTRL SHIFT,2,layoutmsg, movecoltoworkspace 2"
      "SUPER CTRL SHIFT,3,layoutmsg, movecoltoworkspace 3"
    ];
    binde = [
      # S-C-hjkl to resize
      "SUPER CTRL,J,resizeactive, 0 -50"
      "SUPER CTRL,K,resizeactive, 0  50"
    ];
  };
}
