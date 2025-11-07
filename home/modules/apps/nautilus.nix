{pkgs, ...}: {
  home.packages = with pkgs; [
    nautilus
    nautilus-open-any-terminal
  ];
}
