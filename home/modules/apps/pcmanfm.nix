{pkgs, ...}: {
  home.packages = with pkgs; [
    pcmanfm
  ];
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER_SHIFT,E,exec,GTK_THEME=Adwaita:dark pcmanfm"
    ];
    env = [
      # "GTK_THEME,Adwaita:dark"
    ];
    windowrule = [
      "float on, match:class (pcmanfm)"
    ];
  };
  xdg.configFile."libfm/libfm.conf".source = ./libfm.conf;
}
