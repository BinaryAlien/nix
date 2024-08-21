{ pkgs, ... }: {
  documentation.enable = true;

  environment.loginShell = "${pkgs.bashInteractive}/bin/bash -l";
  environment.variables.SHELL = "${pkgs.bashInteractive}/bin/bash";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    clang
    man-pages
    man-pages-posix
  ];

  fonts.packages = [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  nixpkgs.hostPlatform = "aarch64-darwin";

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.bash.enable = true;

  # Create /etc/tmux.conf that sets the default command to the login shell.
  programs.tmux.enable = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  users.users."binary" = {
    name = "binary";
    home = "/Users/binary";
  };

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
