{ config, pkgs, ... }: {
  imports = [
    ../../../home
    ./alacritty.nix
    ./bash.nix
    ./tmux.nix
  ];

  home.file.".nixpkgs/darwin-configuration.nix".source = config.lib.file.mkOutOfStoreSymlink ../configuration.nix;

  home.packages = with pkgs; [
    gimp
    (python3.withPackages (ps: [ ps.ipython ]))
    texliveFull
  ];

  home.username = "binary";
  home.homeDirectory = "/Users/binary";
}
