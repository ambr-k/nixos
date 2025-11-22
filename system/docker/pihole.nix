{pihole_dir, ...}: {...}: {
  imports = [./default.nix];
  virtualisation.oci-containers.containers.pihole = {
    image = "pihole/pihole:latest";
    ports = [
      "53:53/tcp"
      "53:53/udp"
      "80:80/tcp"
      "443:443/tcp"
    ];
    environment = {
      TZ = "America/Denver";
      FTLCONF_dns_listeningMode = "ALL";
    };
    volumes = ["${pihole_dir}:/etc/pihole"];
    capabilities.SYS_NICE = true;
  };
}
