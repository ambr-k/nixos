{ pkgs, ... }:
{
  imports = [./chromium.nix];
  wayland.windowManager.hyprland.settings.bind = ["SUPER,M,exec, chromium --new-window --app=https://open.spotify.com"];
  xdg.desktopEntries.spotify = {
    name = "Spotify";
    exec = "chromium --new-window --app=https://open.spotify.com";
    icon = "${pkgs.fetchurl {
      url = "https://storage.googleapis.com/pr-newsroom-wp/1/2023/05/Spotify_Primary_Logo_RGB_Green.png";
      sha256 = "GT7289I22poeHimRv0SnWggvs8mSVcnuybR+pfZkE/E=";
    }}";
  };
}
