{...}:
{
  imports = [
    ./configuration.nix
    ../../system
    ../../system/nvidia.nix
    ../../system/steam.nix
    ./hardware-configuration.nix
    ./networking.nix
    ./users.nix
    (import ../../system/hyprland_autologin.nix {default_user = "amber";})
  ];
}
