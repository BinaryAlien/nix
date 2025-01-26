{ lib, ... }: {
  programs.alacritty = {
    enable = lib.mkDefault true;

    settings = {
      font = {
        size = lib.mkDefault 28;
        normal.family = "JetBrainsMonoNL Nerd Font";
      };
    };
  };
}
