{pkgs, ...}: {
  services.caddy = {
    enable = true;
    package = pkgs.caddy.withPlugins {
      plugins = ["github.com/caddy-dns/porkbun@v0.3.1"];
      hash = "sha256-s1N/csCCP2O/0buCf064R/WVwuR4qpF25pIJBBTbFYg=";
    };
  };

  networking.firewall.allowedTCPPorts = [443 80];
}
