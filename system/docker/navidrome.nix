{
  data_dir,
  music_dir,
  ...
}: {...}: {
  imports = [./default.nix];

  virtualisation.oci-containers.containers.navidrome = {
    image = "deluan/navidrome:latest";
    user = "1000";
    volumes = ["${data_dir}:/data" "${music_dir}:/music"];
    ports = ["4533:4533"];
  };

  systemd.tmpfiles.settings."${data_dir}"."${data_dir}".d = {
    mode = "0777";
    user = "1000";
  };
  systemd.tmpfiles.settings."${music_dir}"."${music_dir}".d = {
    mode = "0777";
    user = "1000";
  };
}
