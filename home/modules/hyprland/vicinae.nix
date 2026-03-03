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
      nix
      player-pilot
    ];
  };
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER,Space,exec,vicinae toggle"
      "SUPER,C,exec,vicinae deeplink vicinae://extensions/vicinae/clipboard/history"
      "SUPER SHIFT,apostrophe,exec,vicinae deeplink vicinae://extensions/brpaz/brotab/tabs-list"
      "SUPER CTRL ALT,backslash,exec, vicinae server --replace"
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
