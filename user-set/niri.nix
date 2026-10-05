{
  config,
  pkgs,
  ...
}: {
  home.file.".config/niri/config.kdl".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-dot/user-set/config.kdl";
}
