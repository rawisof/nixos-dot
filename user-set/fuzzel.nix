{
  pkgs,
  lib,
  ...
}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Iosevka:size=12";
        lines = 10;
        auto-select = true;
        icons = true;
        icon-theme = "Papirus";
      };
      colors = {
        background = "1a1b26e5";
        text = "c0caf5ff";
        selection-match = "7aa2f7ff";
        match = "bb9af7ff";
        selection = "33467cff";
        selection-text = "c0caf5ff";
        border = "414868ff";
      };
      border = {
        radius = 0;
        width = 1;
      };
    };
  };
}
