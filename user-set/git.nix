{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.git = {
    enable = true;
    extraConfig = {
      include.path = "~/.gitconfig.local";
      init.defaultBranch = "main";
    };
  };
}
