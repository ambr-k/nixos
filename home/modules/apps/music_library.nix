{pkgs, ...}: {
  home.packages = with pkgs; [v25_05.beets nicotine-plus kew recordbox feishin picard];
  xdg.configFile."beets/config.yaml".text = ''
    plugins: fetchart embedart edit discogs lyrics

    lyrics:
      synced: yes
      force: yes
      sources: [lrclib]
  '';

  wayland.windowManager.hyprland.settings.exec-once = ["[workspace special silent] feishin"];
  wayland.windowManager.hyprland.settings.bind = ["SUPER,slash,exec,feishin"];
}
