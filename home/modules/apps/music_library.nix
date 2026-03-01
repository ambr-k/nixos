{pkgs, ...}: {
  home.packages = with pkgs; [beets nicotine-plus kew recordbox feishin picard];
  xdg.configFile."beets/config.yaml".text = ''
    plugins: fetchart embedart edit discogs lyrics

    lyrics:
      synced: yes
      force: yes
  '';

  wayland.windowManager.hyprland.settings.exec-once = ["[workspace special silent] feishin"];
}
