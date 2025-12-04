{data_dir, ...}: {...}: {
  virtualisation.oci-containers.containers.ddnsupdater = {
    image = "qmcgaw/ddns-updater";
    ports = ["8001:8000"];
    volumes = ["${data_dir}:/updater/data"];
    extraOptions = ["--dns=1.1.1.1"];
  };

  systemd.tmpfiles.settings."${data_dir}"."${data_dir}".d = {
    mode = "0777";
    user = "1000";
  };
}
