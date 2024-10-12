{ pkgs, ... }: {
  imports = [
    ../common.nix
  ];

  boot.tmp.cleanOnBoot = true;

  environment.systemPackages = with pkgs; [
    gcc
    gdb
    gnumake
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  time.timeZone = "Europe/Paris";

  users.extraGroups.docker.members = [ "nixos" ];

  virtualisation.docker.enable = true;

  wsl.enable = true;
  wsl.defaultUser = "nixos";
  wsl.interop.includePath = false;
  wsl.wslConf.interop.appendWindowsPath = false;
  wsl.wslConf.network.hostname = "hotland";
}
