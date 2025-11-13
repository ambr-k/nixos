{pkgs, ...}: {
  programs.bat = {
    enable = true;
    config.theme = "rose-pine-moon";
    themes = {
      rose-pine-moon = {
        src = pkgs.fetchFromGitHub {
          owner = "rose-pine";
          repo = "tm-theme";
          rev = "417d201beb5f0964faded5448147c252ff12c4ae";
          sha256 = "aNDOqY81FLFQ6bvsTiYgPyS5lJrqZnFMpvpTCSNyY0Y=";
        };
        file = "dist/rose-pine-moon.tmTheme";
      };
    };
  };
}
