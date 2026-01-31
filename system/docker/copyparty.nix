{
  data_dir,
  config_dir,
  port ? "3923",
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

  virtualisation.oci-containers.containers.copyparty = {
    image = "copyparty/ac";
    user = uid;
    ports = ["${port}:3923" "21:21" "990:990" "12000-12010:12000-12010"];
    volumes = ["${data_dir}:/w" "${config_dir}:/cfg"];
  };

  systemd.tmpfiles.settings."${data_dir}"."${data_dir}".d = {
    mode = "0777";
    user = uid;
  };
  systemd.tmpfiles.settings."${config_dir}"."${config_dir}".d = {
    mode = "0777";
    user = uid;
  };
}
