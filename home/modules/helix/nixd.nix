{
  pkgs,
  osConfig ? {networking.hostName = "carbon";},
  ...
}: {
  programs.helix = {
    extraPackages = with pkgs; [nixd alejandra];
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
        }
      ];
      language-server.nixd = {
        command = "nixd";
        args = ["--semantic-tokens=true"];
      };
      language-server.nixd.config.nixd = let
        myFlake = ''(builtins.getFlake "/etc/nixos")'';
        nixosOpts = "${myFlake}.nixosConfigurations.${osConfig.networking.hostName}.options";
      in {
        formatting.command = ["alejandra"];
        nixpkgs.expr = "import ${myFlake}.inputs.nixpkgs { }";
        options = {
          nixos.expr = nixosOpts;
          home-manager.expr = "${nixosOpts}.home-manager.users.type.getSubOptions []";
        };
      };
    };
  };
}
