{ pkgs, ... }: {
  programs.alacritty.settings = {
    # Force Alacritty to use the intended login shell.
    shell = {
      program = "${pkgs.bashInteractive}/bin/bash";
      args = [ "-l" ];
    };
  };
}
