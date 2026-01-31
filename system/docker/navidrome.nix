{
  data_dir,
  music_dir,
  port ? "4533",
  uid ? "1000",
  caddy ? null,
  ...
}: {...}: {
  imports =
    [./default.nix]
    ++ (
      if caddy != null
      then [(import ./reverse_proxy.nix (caddy // {inherit port;}))]
      else []
    );

  virtualisation.oci-containers.containers.navidrome = {
    image = "deluan/navidrome:latest";
    user = uid;
    ports = ["${port}:4533"];
    volumes = ["${data_dir}:/data" "${music_dir}:/music"];
  };

  systemd.tmpfiles.settings."${data_dir}"."${data_dir}".d = {
    mode = "0777";
    user = uid;
  };
  systemd.tmpfiles.settings."${music_dir}"."${music_dir}".d = {
    mode = "0777";
    user = uid;
  };
}
