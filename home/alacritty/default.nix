{ lib, ... } @ extraArgs:
let
  colors = builtins.fromTOML (builtins.readFile ./catppuccin/catppuccin-${extraArgs.catppuccin-flavor}.toml);
in
{
  programs.alacritty = {
    enable = lib.mkDefault true;

    settings = {
      font = {
        size = lib.mkDefault 17;
        normal.family = "JetBrainsMonoNL Nerd Font";
      };
    } // colors;
  };
}
