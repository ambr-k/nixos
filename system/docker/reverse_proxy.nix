{
  port,
  domains,
  app,
  extra ? "",
  ...
}: {lib, ...}: let
  host = lib.strings.concatMapStringsSep " " (d: "${app}.${d}") domains;
in {
  services.caddy = {
    enable = true;
    virtualHosts.${host} = {
      extraConfig = lib.mkAfter ''
        reverse_proxy :${port}
        ${extra}
      '';
    };
  };
}
