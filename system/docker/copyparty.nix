{
  data_dir,
  config_dir,
  ...
}: {...}: {
  imports = [./default.nix];
  virtualisation.oci-containers.containers.copyparty = {
    image = "copyparty/ac";
    user = "1000";
    ports = ["443:3923" "21:21" "990:990" "12000-12010:12000-12010"];
    volumes = ["${data_dir}:/w" "${config_dir}:/cfg"];
  };
}
