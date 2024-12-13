{ home-manager, catppuccin, nix-darwin, ... }:
nix-darwin.lib.darwinSystem {
  modules = [
    ./configuration.nix
    home-manager.darwinModules.home-manager
    # https://github.com/catppuccin/nix/issues/162
    # catppuccin.darwinModules.catppuccin
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users."binary".imports = [
        ./home
        catppuccin.homeManagerModules.catppuccin
      ];
    }
  ];
}
