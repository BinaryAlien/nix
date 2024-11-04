{ home-manager, nix-darwin, ... }:
nix-darwin.lib.darwinSystem {
  modules = [
    ./configuration.nix
    home-manager.darwinModules.home-manager
    {
      home-manager.extraSpecialArgs = { catppuccin-flavor = "latte"; };
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users."binary" = import ./home;
    }
  ];
}
