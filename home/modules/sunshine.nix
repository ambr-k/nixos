{
  lib,
  config,
  ...
}: {
  xdg.configFile."sunshine/apps.json".source = lib.mkForce (config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/sunshine/.apps.json");
}
