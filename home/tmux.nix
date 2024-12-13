{ ... }: {
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    clock24 = true;
    keyMode = "vi";
    shortcut = "a";
    terminal = "$TERM";

    extraConfig = ''
      set -ga terminal-overrides ",$TERM:Tc"
      set -g renumber-windows on
      set -g repeat-time 0

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      bind -T copy-mode-vi p send-keys -X copy-pipe-and-cancel "tmux paste-buffer"
      bind -T copy-mode-vi v send-keys -X begin-selection
    '';

    catppuccin.extraConfig = ''
      set -g @catppuccin_status_connect_separator "no"
      set -g @catppuccin_status_left_separator "█"
      set -g @catppuccin_status_right_separator "█"
      set -g @catppuccin_window_current_number_color "#{@thm_sky}"
      set -g @catppuccin_window_current_text " #W"
      set -g @catppuccin_window_left_separator "█"
      set -g @catppuccin_window_number_position "left"
      set -g @catppuccin_window_right_separator "█"
      set -g @catppuccin_window_text " #W"
      set -g status-left ""
      set -g status-right "#{E:@catppuccin_status_session}"
    '';
  };
}
