{data_dir, ...}: {...}: {
  virtualisation.oci-containers.containers.foundryvtt = {
    image = "gbeine/foundry:13.351";
    ports = ["30000:30000"];
    volumes = ["${data_dir}:/data"];
  };

  systemd.tmpfiles.settings."${data_dir}"."${data_dir}".d.mode = "0777";
}
