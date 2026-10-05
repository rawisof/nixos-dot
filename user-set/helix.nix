{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    enable = true;

    settings = {
      theme = "stylix";

      editor = {
        line-number = "relative";
        cursorline = true;
        mouse = false;

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        statusline = {
          left = ["mode" "spacer" "spinner" "spacer" "file-name" "file-modification-indicator"];
          center = ["diagnostics"];
          right = ["file-type" "file-encoding" "spacer" "position" "position-percentage" "spacer" "version-control"];
          separator = "│";

          mode = {
            normal = "🅝  NORMAL";
            insert = "🅘  INSERT";
            select = "🅢  SELECT";
          };
        };

        lsp = {
          display-messages = true;
        };
      };

      keys = {
        normal = {
          "esc" = ["collapse_selection" "keep_primary_selection"];
        };
      };
    };

    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = lib.getExe pkgs.alejandra;
      }
    ];
  };
}
