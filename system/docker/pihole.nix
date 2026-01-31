{
  pihole_dir,
  port ? "880",
  uid ? "0",
  caddy ? null,
  ssl_port ? "8443",
  ...
}: {...}: {
  imports =
    [./default.nix]
    ++ (
      if caddy != null
      then [(import ./reverse_proxy.nix (caddy // {inherit port;}))]
      else []
    );

  virtualisation.oci-containers.containers.pihole = {
    image = "pihole/pihole:latest";
    user = uid;
    ports = [
      "53:53/tcp"
      "53:53/udp"
      "${port}:80/tcp"
      "${ssl_port}:443/tcp"
    ];
    volumes = ["${pihole_dir}:/etc/pihole"];
    environment = {
      TZ = "America/Denver";
      FTLCONF_dns_listeningMode = "ALL";
    };
    capabilities.SYS_NICE = true;
  };

  systemd.tmpfiles.settings."${pihole_dir}"."${pihole_dir}".d = {
    mode = "0777";
    user = uid;
  };
}
