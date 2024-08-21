{ ... }: {
  imports = [
    ../../../home
    ./tmux.nix
  ];

  home.username = "nixos";
  home.homeDirectory = "/home/nixos";
}
