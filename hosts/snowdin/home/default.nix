{ config, ... }: {
  imports = [
    ../../../home
    ./alacritty.nix
    ./bash.nix
    ./tmux.nix
  ];

  home.file.".nixpkgs/darwin-configuration.nix".source = config.lib.file.mkOutOfStoreSymlink ../configuration.nix;

  home.username = "binary";
  home.homeDirectory = "/Users/binary";
}
