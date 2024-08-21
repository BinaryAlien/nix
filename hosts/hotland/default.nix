{ nixpkgs, home-manager, nixos-wsl, ... }:
nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  modules = [
    ./configuration.nix
    nixos-wsl.nixosModules.wsl
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users."nixos" = import ./home;
    }
  ];
}
