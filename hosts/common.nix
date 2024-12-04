{ pkgs, ... }: {
  documentation.enable = true;

  environment.systemPackages = with pkgs; [
    coreutils
    man-pages
    man-pages-posix
    openssh
    tree
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
