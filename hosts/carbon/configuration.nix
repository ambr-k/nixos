{
  config,
  pkgs,
  inputs,
  ...
}: {
  boot = {
    blacklistedKernelModules = ["r8169"];

    extraModulePackages = with config.boot.kernelPackages; [
      r8125
    ];
    kernelModules = ["r8125" "i2c-dev"];
    kernelPackages = pkgs.linuxPackages_latest;

    supportedFilesystems = ["ntfs"];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.envy-code-r
    nerd-fonts.hurmit

    inputs.aporetic-nerd-font.packages.${pkgs.stdenv.hostPlatform.system}.aporetic-nerd-font
  ];

  hardware.i2c.enable = true;
  services.hardware.openrgb = {
    enable = true;
  };

  programs.kdeconnect.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
