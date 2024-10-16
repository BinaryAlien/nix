{ pkgs, ... }: {
  imports = [
    ./alacritty
    ./bash.nix
    ./git.nix
    ./neovim
    ./starship.nix
    ./tmux
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    eza
    git-lfs
  ];

  home.sessionVariables = {
    LESSHISTFILE = "/dev/null";
  };

  home.shellAliases = {
    c = "clear";
    eza = "eza --icons=automatic";
    g = "git";
    l = "eza -l";
    la = "eza -al";
    ls = "eza";
    tree = "eza --tree";
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
