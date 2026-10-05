{pkgs, ...}: {
  home.packages = [pkgs.wlogout];

  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 4;

        modules-left = ["custom/nixos" "niri/workspaces"];
        modules-center = ["clock"];
        modules-right = ["wireplumber" "network" "battery" "tray" "custom/wlogout"];

        "custom/nixos" = {
          format = " ";
          tooltip = false;
        };

        "niri/workspaces" = {
          format = "{index}";
        };

        "clock" = {
          format = "{:%H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "wireplumber" = {
          format = "{icon} {volume}%";
          format-muted = "   Muted";
          on-click = "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          scroll-step = 5;

          format-icons = [" "];
        };

        "network" = {
          format-wifi = " ";
          format-ethernet = "󰈀 ";
          format-disconnected = "󰈂 ";
          tooltip-format = "{ifname} via {gwaddr}";
          tooltip-format-wifi = "{essid} ({signaldBm}dBm)";
          tooltip-format-disconnected = "Disconnected";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "   {capacity}%";
          format-icons = [" " " " " " " "];
        };

        "tray" = {
          icon-size = 14;
          spacing = 10;
        };

        "custom/wlogout" = {
          format = " ";
          on-click = "${pkgs.wlogout}/bin/wlogout";
          tooltip = false;
        };
      }
    ];

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", "Roboto", sans-serif;
        font-size: 13px;
        border: none;
        border-radius: 0;
        min-height: 0;
        box-shadow: none;
        text-shadow: none;
      }

      window#waybar {
        background: transparent;
        border-bottom: 2px solid @border_color;
      }

      #custom-nixos,
      #workspaces,
      #clock,
      #wireplumber,
      #network,
      #battery,
      #tray,
      #custom-wlogout {
        padding: 0 10px;
        background: transparent;
      }

      #workspaces button {
        padding: 0 8px;
        background: transparent;
        border-bottom: 3px solid transparent;
        transition: all 0.15s ease-in-out;
      }

      #workspaces button.focused {
        font-weight: bold;
      }

      #workspaces button.focused.workspace-1 {
        border-bottom: 3px solid #ff5555; /* Красный */
      }
      #workspaces button.focused.workspace-2 {
        border-bottom: 3px solid #ffb86c; /* Оранжевый */
      }
      #workspaces button.focused.workspace-3 {
        border-bottom: 3px solid #f1fa8c; /* Желтый */
      }
      #workspaces button.focused.workspace-4 {
        border-bottom: 3px solid #50fa7b; /* Зеленый */
      }
      #workspaces button.focused.workspace-5 {
        border-bottom: 3px solid #8be9fd; /* Голубой */
      }
    '';
  };
}
