{ pkgs, ... }: {
  imports = [
    ../../../home
    ./alacritty.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    ffmpeg
    yt-dlp
  ];

  home.username = "nixos";
  home.homeDirectory = "/home/nixos";
}
