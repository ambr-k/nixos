{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  system,
  ...
}: {
  boot = {
    blacklistedKernelModules = ["r8169"];

    extraModulePackages = with config.boot.kernelPackages; [
      r8125
    ];
    kernelModules = ["r8125" "i2c-dev"];

    supportedFilesystems = ["ntfs"];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.envy-code-r
    nerd-fonts.hurmit

    inputs.aporetic-nerd-font.packages.${system}.aporetic-nerd-font
  ];

  hardware.i2c.enable = true;
  services.hardware.openrgb = {
    enable = true;
    package =
      pkgs-unstable.openrgb-with-all-plugins.overrideAttrs
      (old: {
        src = pkgs.fetchFromGitLab {
          owner = "CalcProgrammer1";
          repo = "OpenRGB";
          rev = "release_candidate_1.0rc2";
          sha256 = "sha256-vdIA9i1ewcrfX5U7FkcRR+ISdH5uRi9fz9YU5IkPKJQ=";
        };
        patches = [
          ./remove_openrgb_systemd.patch
        ];
        postPatch = ''
          patchShebangs scripts/build-udev-rules.sh
          substituteInPlace scripts/build-udev-rules.sh \
           --replace-fail /usr/bin/env "${pkgs.coreutils}/bin/env"
        '';
        version = "release_candidate_1.0rc2";
        motherboard = "intel";
      });
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
