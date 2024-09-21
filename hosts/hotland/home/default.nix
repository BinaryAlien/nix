{ pkgs, ... }: {
  imports = [
    ../../../home
    ./alacritty.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    ffmpeg
  ];

  home.username = "nixos";
  home.homeDirectory = "/home/nixos";
}
