{
  data_dir,
  port ? "8000",
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

  virtualisation.oci-containers.containers.ddnsupdater = {
    image = "qmcgaw/ddns-updater";
    user = uid;
    ports = ["${port}:8000"];
    volumes = ["${data_dir}:/updater/data"];
    extraOptions = ["--dns=1.1.1.1"];
  };

  systemd.tmpfiles.settings."${data_dir}"."${data_dir}".d = {
    mode = "0777";
    user = uid;
  };
}
