{ lib, ... }:
let
  colors = builtins.fromTOML (builtins.readFile ./catppuccin/catppuccin-macchiato.toml);
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
