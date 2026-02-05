{
  config,
  lib,
  secrets,
  ...
}: let
  domain = "amberk.xyz";
  domains = [domain "${config.networking.hostName}.${domain}"];
  caddy = app: {
    inherit domains app;
  };
in {
  imports = [
    ../../system/caddy.nix

    (import ../../system/docker/copyparty.nix {
      data_dir = "/mnt/data";
      config_dir = "/mnt/data/copyparty";
      port = "3923";
      caddy = caddy "files";
    })

    (import ../../system/docker/pihole.nix {
      pihole_dir = "/pihole";
      port = "880";
      caddy = caddy "pihole";
    })

    (import ../../system/docker/foundryvtt.nix {
      data_dir = "/foundryvtt";
      port = "30000";
      caddy = caddy "foundryvtt";
    })

    (import ../../system/docker/ddns-updater.nix {
      data_dir = "/ddnsupdater";
      port = "8001";
      caddy = caddy "ddns";
    })

    (import ../../system/docker/navidrome.nix {
      data_dir = "/navidrome";
      music_dir = "/mnt/data/Music";
      port = "4533";
      caddy = caddy "music";
    })

    (import ../../system/docker/syncthing.nix {
      config_dir = "/syncthing";
      caddy = caddy "sync";
      mounts = ["/mnt:/mnt"];
      gui_addr = "0.0.0.0:8384";
    })
  ];

  services.caddy.extraConfig = ''
    ${lib.strings.concatMapStringsSep " " (d: "*.${d}") domains} {
      tls {
        propagation_timeout -1
        dns porkbun  {
          api_key ${secrets.porkbun.api_key}
          api_secret_key ${secrets.porkbun.api_secret_key}
        }
      }
    }
  '';

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
