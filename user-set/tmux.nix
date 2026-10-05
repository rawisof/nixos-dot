{
  pkgs,
  lib,
  ...
}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 10000;
    keyMode = "vi";
    mouse = true;

    shortcut = "a";

    escapeTime = 0;
    baseIndex = 1;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
    ];

    extraConfig = ''
      set-option -s -a terminal-features ",xterm-256color:RGB"


      unbind '"'
      unbind %
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind -r C-Up resize-pane -U 5
      bind -r C-Down resize-pane -D 5
      bind -r C-Left resize-pane -L 5
      bind -r C-Right resize-pane -R 5

      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      set -g status-justify left
      set -g status-bg "#1e1e2e" # Темный пастельный фон
      set -g status-fg "#cdd6f4" # Светлый текст

      set -g status-left "#[fg=#1e1e2e,bg=#b4befe,bold]    #S #[bg=default,fg=default] "
      set -g status-left-length 20

      set -g status-right "#[fg=#6c7086] %Y-%m-%d │ #[fg=#cdd6f4,bold]%H:%M "

      setw -g window-status-format "#[fg=#6c7086] #I:#W "
      setw -g window-status-current-format "#[fg=#a6e3a1,bold,bg=#313244] #I:#W* "
    '';
  };
}
