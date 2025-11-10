{...}: {
  imports = [
    ./configuration.nix
    ../../system
    ../../system/ssh.nix
    ./hardware-configuration.nix
    ./networking.nix
    ./users.nix
  ];
}
