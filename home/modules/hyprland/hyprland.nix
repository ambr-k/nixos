{
  pkgs,
  inputs,
  system,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    settings = {
      monitor = [",preferred,auto,1.25"];
      xwayland.force_zero_scaling = true;
      env = [
        "NIXOS_OZONE_WL,1"
        "GDK_SCALE,2"
      ];
      general.gaps_out = "5,10,10,10";
      general.gaps_in = "4";
      decoration.rounding = "8";
      decoration.blur.passes = 2;
      decoration.blur.special = true;
      bind = [
        "SUPER,Return,exec,ghostty"
        "SUPER CTRL,Return,exec,[float] ghostty"
        "SUPER,F,exec,firefox"
        "SUPER,D,exec,discordcanary"
        "SUPER,Q,killactive"
        "ALT,F4,killactive"
        "SUPER CTRL ALT,Q,exit"
        "SUPER,Grave,togglespecialworkspace"
        "SUPER,1,workspace,1"
        "SUPER,2,workspace,2"
        "SUPER,3,workspace,3"
        "SUPER SHIFT,Grave,movetoworkspacesilent,special"
        "SUPER SHIFT,1,movetoworkspacesilent,1"
        "SUPER SHIFT,2,movetoworkspacesilent,2"
        "SUPER SHIFT,3,movetoworkspacesilent,3"
        "SUPER,mouse:274,togglefloating"
      ];
      bindm = [
        "SUPER,mouse:272,movewindow"
        "SUPER,mouse:273,resizewindow"
      ];
      animation = [
        "workspaces, 1, 4, default, slidevert"
        "specialWorkspace, 1, 4, default, fade"
      ];
      exec-once = [
        "systemctl --user start hyprpolkitagent"
      ];
      windowrulev2 = [
        "float, title:(Select what to share)"
      ];
    };
  };

  home.packages = with pkgs; [libnotify hyprpolkitagent];
}
