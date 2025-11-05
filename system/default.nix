{...}: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./enable_flakes.nix
    ./i18n.nix
    ./kmscon.nix
    ./networking.nix
    ./systemd-boot.nix
    ./tools.nix
    ./zsh.nix
  ];
}
