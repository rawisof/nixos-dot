{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./user-set/zsh.nix
    ./user-set/ghostty.nix
    ./user-set/fuzzel.nix
    ./user-set/stylix.nix
    ./user-set/bar.nix
    ./user-set/tmux.nix
    ./user-set/mako.nix
    ./user-set/helix.nix
    ./user-set/niri.nix
    ./user-set/git.nix
  ];

  home.username = "joke";
  home.homeDirectory = "/home/joke";
  home.stateVersion = "26.11";

  home.packages = [
    pkgs.ripgrep
    pkgs.eza
    pkgs.fzf
    pkgs.papirus-icon-theme
    pkgs.p7zip
    pkgs.alejandra
    pkgs.lxappearance
    pkgs.thunar
    pkgs.pavucontrol
    pkgs.blueman
    pkgs.vlc
    pkgs.freetube
    pkgs.grim
    pkgs.slurp
    pkgs.wlogout
    pkgs.firefox
    pkgs.onlyoffice-desktopeditors
    pkgs.ayugram-desktop
    pkgs.jq
    pkgs.mako
    pkgs.swww
    pkgs.fastfetch
  ];

  programs.helix = {
    enable = true;
    settings = {
      theme = "stylix";
      editor = {
        line-number = "relative";
        mouse = false;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        lsp = {
          display-messages = true;
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

  # home.pointerCursor = {
  #  name = "Bibata-Modern-Classic";
  # package = pkgs.bibata-cursors;
  # size = 24;
  # gtk.enable = true;
  # x11.enable = true;
  # };

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
    TERMINAL = "ghostty";
  };
}
