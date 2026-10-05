{
  pkgs,
  lib,
  ...
}: {
  stylix = {
    enable = true;

    image = ../nix-chan.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

    polarity = "dark";

    autoEnable = true;

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    targets.gtk.enable = true;
    targets.qt.enable = true;
    targets.fuzzel.enable = false;
    targets.ghostty.enable = false;
    targets.helix.enable = true;
    targets.mako.enable = true;
    targets.waybar.enable = true;
  };
}
