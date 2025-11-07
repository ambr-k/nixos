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
      wallpaper = "~/wallpapers/yuri-bike.jpg";
      lock_wallpaper = "~/wallpapers/poly4.png";
    })
    ../../modules/hyprland/start_locked.nix
    ../../modules/apps
    ../../modules/apps/spotify.nix
    ../../modules/apps/discord.nix
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
