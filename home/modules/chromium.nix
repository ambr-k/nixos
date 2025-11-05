{ pkgs, ... }:
{
  # only using this for thhe --app argument
  home.packages=[(pkgs.chromium.override {enableWideVine=true;})];
}
