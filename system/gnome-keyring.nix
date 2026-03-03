{pkgs, ...}: {
  services.gnome.gnome-keyring.enable = true;
  environment.systemPackages = [pkgs.libsecret pkgs.gcr pkgs.seahorse pkgs.libgnome-keyring];
}
