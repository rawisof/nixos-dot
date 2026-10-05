{pkgs, lib, ... }:
{

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "TokyoNight";
      font-family = "Iosevka";
      font-size = "16";
    };
  };
  
}
