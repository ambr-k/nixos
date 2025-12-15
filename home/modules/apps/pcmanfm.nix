{pkgs, ...}: {
  home.packages = with pkgs; [
    pcmanfm
  ];
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER,E,exec,pcmanfm"
    ];
    env = [
      "GTK_THEME,Adwaita:dark"
    ];
    windowrulev2 = [
      "float,class:(pcmanfm)"
    ];
  };
  xdg.configFile."libfm/libfm.conf".source = ./libfm.conf;
}
