{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  ...
}: {
  imports = [
    (import ../../modules/hyprland {
      wallpaper = "~/wallpapers/poly1.png";
      lock_wallpaper = "~/wallpapers/poly4.png";
    })
    ../../modules/hyprland/start_locked.nix
    ../../modules/bibata-cursor.nix
    ../../modules/firefox.nix
    ../../modules/spotify.nix
    ../../modules/discord.nix
    ../../modules/ghostty.nix
    ../../modules/zsh.nix
  ];

  home.username = "amber";
  home.homeDirectory = "/home/amber";

  programs.git = {
    enable = true;
    userName = "Amber Kirschbaum";
    userEmail = "amber.fae.k@gmail.com";
  };

  home.stateVersion = "25.05";
}
