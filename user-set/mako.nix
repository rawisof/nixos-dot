{
  pkgs,
  lib,
  ...
}: {
  services.mako = {
    enable = true;

    settings = {
      anchor = "top-right";
      "max-visible" = 3;
      sort = "-time";

      width = 320;
      height = 110;
      margin = "10";
      padding = "12";

      "border-size" = 2;
      "border-radius" = 4;
      icons = true;
      "max-icon-size" = 48;
      markup = true;
      actions = true;

      "default-timeout" = 5000;
      "ignore-yank" = true;

      format = "<b>%a • %s</b>\\n%b";

      "urgency=high" = {
        "border-color" = "#ff5555";
        "default-timeout" = 0;
      };
    };
  };
}
