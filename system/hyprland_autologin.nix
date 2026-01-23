{default_user}: {...}: {
  imports = [./hyprland.nix];
  services.greetd.settings.initial_session = {
    command = "start-hyprland >/dev/null 2>&1";
    user = default_user;
  };
}
