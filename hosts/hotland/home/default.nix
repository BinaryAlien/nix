{ ... }: {
  imports = [
    ../../../home
    ./alacritty.nix
    ./tmux.nix
  ];

  home.username = "nixos";
  home.homeDirectory = "/home/nixos";
}
