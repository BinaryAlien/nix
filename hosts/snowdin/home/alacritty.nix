{ pkgs, ... }: {
  programs.alacritty.settings = {
    font.size = 20;

    # Force Alacritty to use the intended login shell.
    shell = {
      program = "${pkgs.bashInteractive}/bin/bash";
      args = [ "-l" ];
    };
  };
}
