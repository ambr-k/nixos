{pkgs, ...}: {
  services.caddy = {
    enable = true;
    package = pkgs.caddy.withPlugins {
      plugins = ["github.com/caddy-dns/porkbun@v0.3.1"];
      hash = "sha256-C+eTduZvOlewyzOxtTqmmWXL2yVqAq/ltq+XrzD1otY=";
    };
  };

  networking.firewall.allowedTCPPorts = [443 80];
}
