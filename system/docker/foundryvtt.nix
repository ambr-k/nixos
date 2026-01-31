{
  data_dir,
  port ? "30000",
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

  virtualisation.oci-containers.containers.foundryvtt = {
    image = "gbeine/foundry:13.351";
    user = uid;
    ports = ["${port}:30000"];
    volumes = ["${data_dir}:/data"];
  };

  systemd.tmpfiles.settings."${data_dir}"."${data_dir}".d = {
    mode = "0777";
    user = uid;
  };
}
