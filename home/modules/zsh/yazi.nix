{pkgs, ...}: {
  programs.yazi.enable = true;
  programs.yazi.theme.flavor.dark = "rose-pine-moon";
  programs.yazi.flavors.rose-pine-moon = let
    repo = pkgs.fetchFromGitHub {
      owner = "rose-pine";
      repo = "yazi";
      rev = "fd385266af5f3419657e449607f3e87f062d0d2e";
      sha256 = "3j7TTtzG+GCB4uVeCiuvb/0dCkHPz7X+MDBVVUp646A=";
    };
  in "${repo}/flavors/rose-pine-moon.yazi";
}
