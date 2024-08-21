{ ... }: {
  programs.bash.sessionVariables = {
    BASH_SILENCE_DEPRECATION_WARNING = 1;
  };
}
