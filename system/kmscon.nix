{
  pkgs,
  inputs,
  ...
}: {
  services.kmscon = {
    enable = true;
    fonts = [
      {
        name = "AporeticSerifMono Nerd Font";
        package = inputs.aporetic-nerd-font.packages.${pkgs.stdenv.hostPlatform.system}.aporetic-nerd-font;
      }
    ];
    extraConfig = ''
      font-size=16
    '';
  };
}
