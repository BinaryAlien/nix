{ pkgs, ... }: {
  documentation.enable = true;

  environment.systemPackages = with pkgs; [
    man-pages
    man-pages-posix
    openssh
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
