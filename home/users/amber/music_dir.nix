{config, ...}: {
  services.syncthing = {
    enable = true;
    tray.enable = true;
    settings = {
      devices = {
        "lithium" = {
          id = "34HODCQ-VL6LOMM-4PZUGXZ-SRUHNGQ-LCXZZ4U-LCZOBSU-JFO3MHN-BK4DWAM";
        };
      };
      folders = {
        "${config.home.homeDirectory}/Music" = {
          id = "ktrht-llwyq";
          devices = ["lithium"];
        };
      };
    };
  };
}
