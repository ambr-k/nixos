{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [brotab playerctl];
  programs.vicinae = {
    enable = true;
    settings = {
      theme.dark.name = "rose-pine-moon";
      launcher_window.opacity = 1;
      font.normal.family = "AporeticSerifMonoNerdFont";
      pop_to_root_on_close = true;
    };
    extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
      brotab
      nix
      player-pilot
    ];
  };
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER,Space,exec,vicinae toggle"
      "SUPER,C,exec,vicinae deeplink vicinae://extensions/vicinae/clipboard/history"
      "SUPER CTRL ALT,Backslash,exec, vicinae server"
    ];
    exec-once = ["vicinae server"];
    windowrule = [
      "stay_focused on, match:title (Vicinae Launcher)"
    ];
    layerrule = [
      "blur on, ignore_alpha 0, match:namespace vicinae"
      "animation popin, match:namespace vicinae"
    ];
  };
}
