{pkgs, ...}: {
  home.packages = [pkgs.git-crypt];
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-tty;
  };
}
