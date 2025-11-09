{...}: {
  networking = {
    hostName = "lithium";
    interfaces.enp4s0 = {
      ipv4.addresses = [
        {
          address = "10.0.0.3";
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = "10.0.0.1";
    nameservers = ["1.1.1.1" "8.8.8.8"];
  };
}
