{ ... }: {
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./eza.nix
    ./git.nix
    ./neovim
    ./starship.nix
    ./tmux.nix
    ./zoxide.nix
  ];

  home.sessionVariables = {
    LESSHISTFILE = "/dev/null";
  };

  home.shellAliases = {
    c = "clear";
    g = "git";
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";
}
