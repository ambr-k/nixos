{config, ...}: {
  home.file."Music".source = config.lib.file.mkOutOfStoreSymlink /mnt/lithium/Music;
}
