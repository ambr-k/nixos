{config, ...}: {
  services.syncthing = {
    enable = true;
    tray.enable = true;
    settings = {
      devices = {
        "lithium" = {
          id = "34HODCQ-VL6LOMM-4PZUGXZ-SRUHNGQ-LCXZZ4U-LCZOBSU-JFO3MHN-BK4DWAM";
        };
        "Retroid Flip 2" = {
          id = "5TSKAJS-NDTGQWR-PGR4LWD-JUR7XAJ-XVPBWMW-WF7NEQT-7QC4IE2-CHLFSQA";
        };
      };
      folders = {
        "${config.home.homeDirectory}/ROMs" = {
          id = "vkx9q-stg3q";
          devices = ["lithium" "Retroid Flip 2"];
        };
      };
    };
  };
}
