{pkgs, ...}: {
  programs.yazi = {
    enable = true;

    theme.flavor.dark = "rose-pine-moon";
    flavors.rose-pine-moon = let
      repo = pkgs.fetchFromGitHub {
        owner = "rose-pine";
        repo = "yazi";
        rev = "fd385266af5f3419657e449607f3e87f062d0d2e";
        sha256 = "3j7TTtzG+GCB4uVeCiuvb/0dCkHPz7X+MDBVVUp646A=";
      };
    in "${repo}/flavors/rose-pine-moon.yazi";

    plugins = {
      chmod = pkgs.yaziPlugins.chmod;
      git = pkgs.yaziPlugins.git;
    };
    keymap.mgr.prepend_keymap = [
      {
        on = ["c" "m"];
        run = "plugin chmod";
        desc = "chmod selected files";
      }
      {
        on = ["g" "i"];
        run = "shell --block -- lazygit";
        desc = "Run lazyzgit";
      }
    ];
    settings.plugin.prepend_fetchers = [
      {
        id = "git";
        name = "*";
        run = "git";
      }
      {
        id = "git";
        name = "*/";
        run = "git";
      }
    ];
    initLua = ''
      require("git"):setup()
    '';
  };
}
