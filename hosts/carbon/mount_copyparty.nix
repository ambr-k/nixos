{...}: {
  services.davfs2.enable = true;

  fileSystems."/mnt/lithium" = {
    fsType = "davfs";
    device = "https://files.lithium.amberk.xyz/";
    options = ["uid=1000"];
  };

  systemd.tmpfiles.settings."/etc/davfs2/secrets"."/etc/davfs2/secrets".f = {
    mode = "0600";
    user = "0";
  };
}
