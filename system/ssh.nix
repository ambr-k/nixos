{...}: {
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      PermitRootLogin = "no";
    };
  };
}
