{ ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellOptions = [
      "checkjobs"
      "checkwinsize"
      "extglob"
      "globstar"
    ];

    bashrcExtra = ''
      unset HISTFILE
      set -o vi
    '';
  };
}
