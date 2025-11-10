{
  data_dir,
  config_dir,
  ...
}: {...}: {
  imports = [./default.nix];
  virtualisation.oci-containers.containers.copyparty = {
    image = "copyparty/ac";
    user = "1000";
    ports = ["3923:3923"];
    volumes = ["${data_dir}:/w" "${config_dir}:/cfg"];
  };
}
