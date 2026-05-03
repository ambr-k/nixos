{pkgs, ...}: {
  services.caddy = {
    enable = true;
    package = pkgs.caddy.withPlugins {
      plugins = ["github.com/caddy-dns/porkbun@v0.3.1"];
      hash = "sha256-pt4jyNcfacZKxzRH7zW7l2/+YfmVKWxGD4JTyWpvD1E=";
    };
  };

  networking.firewall.allowedTCPPorts = [443 80];
}
