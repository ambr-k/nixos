{...}: {
  imports = [
    ./configuration.nix
    ../../system
    ../../system/docker
    ../../system/nvidia.nix
    ../../system/printing.nix
    ../../system/steam.nix
    ../../system/hyprland.nix
    ../../system/gnome-keyring.nix
    ./hardware-configuration.nix
    ./networking.nix
    ./users.nix
    ./mount_copyparty.nix
  ];
}
