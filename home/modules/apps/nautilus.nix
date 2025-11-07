{pkgs, ...}: {
  home.packages = with pkgs; [
    nautilus
    nautilus-open-any-terminal
  ];
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER,E,exec,nautilus"
      "SUPER CTRL,E,exec,[float] nautilus"
    ];
    env = [
      "GTK_THEME,Adwaita:dark"
    ];
  };
}
