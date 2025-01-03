{ config, pkgs, ... }: {
  imports = [
    ../../../home
    ./alacritty.nix
    ./bash.nix
    ./direnv.nix
    ./tmux.nix
  ];

  home.file.".nixpkgs/darwin-configuration.nix".source = config.lib.file.mkOutOfStoreSymlink ../configuration.nix;

  home.packages = with pkgs; [
    gimp
    pre-commit
    (python3.withPackages (ps: [ ps.ipython ]))
    stats
    texliveFull
    uv
  ];

  home.username = "binary";
  home.homeDirectory = "/Users/binary";
}
