{ inputs, ... }:
{
  imports = [inputs.vicinae.homeManagerModules.default];

  services.vicinae.enable = true;
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER,Space,exec,vicinae toggle"
      "SUPER CTRL ALT,Backslash,exec, vicinae server"
    ];
    env=["USE_LAYER_SHELL,0"];
    layerrule = [
      "blur,vicinae"
      "ignorealpha 0, vicinae"
      "noanim,vicinae"
    ];
    exec-once = [ "vicinae server" ];
  };
}
