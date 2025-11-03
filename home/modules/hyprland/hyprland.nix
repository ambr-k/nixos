{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    settings = {
      monitor = [",preferred,auto,1.25"];
      general.gaps_out = "5,10,10,10";
      general.gaps_in = "2";
      decoration.rounding = "8";
      bind = [
        "SUPER,Return,exec,ghostty"
        "SUPER,F,exec,firefox"
        "SUPER,D,exec,discordcanary --enable-features-UseOzonePlatform --ozone-platform=wayland"
        "SUPER,Q,killactive"
        "ALT,F4,killactive"
        "SUPER CTRL ALT,Q,exit"
      ];
    };
  };
}
