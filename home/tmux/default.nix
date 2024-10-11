{ lib, pkgs, ... } @ extraArgs: {
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    clock24 = true;
    keyMode = "vi";
    shortcut = "s";
    terminal = "$TERM";

    plugins = [{
      plugin = pkgs.tmuxPlugins.catppuccin;
      extraConfig = import ./catppuccin.nix extraArgs;
    }];

    extraConfig = ''
      set -ga terminal-overrides ",$TERM:Tc"
      set -g renumber-windows on
      set -g repeat-time 0

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      bind -T copy-mode-vi p send-keys -X copy-pipe-and-cancel "tmux paste-buffer"
      bind -T copy-mode-vi v send-keys -X begin-selection
    '';
  };
}
