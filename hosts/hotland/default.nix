{ nixpkgs, home-manager, catppuccin, nixos-wsl, ... }:
nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  modules = [
    ./configuration.nix
    nixos-wsl.nixosModules.wsl
    catppuccin.nixosModules.catppuccin
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users."nixos".imports = [
        ./home
        catppuccin.homeManagerModules.catppuccin
      ];
    }
  ];
}
