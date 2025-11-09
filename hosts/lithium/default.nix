{...}: {
  imports = [
    ./configuration.nix
    ../../system
    ./hardware-configuration.nix
    ./networking.nix
    ./users.nix
  ];
}
