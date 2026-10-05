{pkgs, lib, ... }:
{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza --icons=auto";
      tree = "eza --tree --icons=auto";
    };

    initContent = ''
      prompt off
      export PROMPT='%F{196}[%F{208}%n%F{226}@%F{46}%m%F{196}]%f %F{45}%~%f %F{93}$%f  '
    '';

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
  };
  
}
