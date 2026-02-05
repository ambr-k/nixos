{
  config_dir,
  uid ? "1000",
  caddy ? null,
  mounts ? [],
  gui_addr ? "",
  ...
}: {...}: {
  imports =
    [./default.nix]
    ++ (
      if caddy != null
      then [(import ./reverse_proxy.nix (caddy // {port = "8384";}))]
      else []
    );

  virtualisation.oci-containers.containers.syncthing = {
    image = "syncthing/syncthing";
    volumes = ["${config_dir}:/var/syncthing/config"] ++ mounts;
    environment = {
      PUID = uid;
      PGID = uid;
      STGUIADDRESS = gui_addr;
    };
    extraOptions = ["--network=host"];
  };

  systemd.tmpfiles.settings."${config_dir}"."${config_dir}".d = {
    mode = "0777";
    user = uid;
  };
}
