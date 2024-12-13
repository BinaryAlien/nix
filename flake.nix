{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, catppuccin, nixos-wsl, nix-darwin }: {
    nixosConfigurations."hotland" = import ./hosts/hotland { inherit nixpkgs home-manager catppuccin nixos-wsl; };

    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#snowdin
    darwinConfigurations."snowdin" = import ./hosts/snowdin { inherit nixpkgs home-manager catppuccin nix-darwin; };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."snowdin".pkgs;
  };
}
