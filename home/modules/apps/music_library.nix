{pkgs, ...}: {
  home.packages = with pkgs; [beets nicotine-plus kew strawberry];
  xdg.configFile."beets/config.yaml".text = ''
    plugins: fetchart embedart edit discogs
  '';
}
