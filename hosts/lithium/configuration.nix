{
  config,
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    (import ../../system/docker/copyparty.nix {
      data_dir = "/mnt/data";
      config_dir = "/mnt/data/copyparty";
    })
    (import ../../system/docker/pihole.nix {
      pihole_dir = "/pihole";
    })
    (import ../../system/docker/foundryvtt.nix {
      data_dir = "/foundryvtt";
    })
    (import ../../system/docker/ddns-updater.nix {
      data_dir = "/ddnsupdater";
    })
  ];

  systemd.tmpfiles.settings."pihole_dir" = {
    "/pihole" = {d.mode = "0777";};
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
