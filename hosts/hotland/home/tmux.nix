{ ... }: {
  programs.tmux.extraConfig = ''
    bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
  '';
}
