{ lib, pkgs, ... } @ extraArgs:
let
  readLuaConfig = plugin: {
    inherit plugin;
    type = "lua";
    config = builtins.readFile ./plugin/${plugin.pname}.lua;
  };
  readNixConfig = plugin: {
    inherit plugin;
    type = "lua";
    config = import ./plugin/${plugin.pname}.nix extraArgs;
  };
in
{
  programs.neovim = {
    enable = true;

    defaultEditor = true;
    viAlias = true;

    plugins = with pkgs.vimPlugins; map readLuaConfig [
      conform-nvim
      lualine-nvim
      nvim-cmp
      nvim-lspconfig
      nvim-tree-lua
      nvim-treesitter.withAllGrammars
      telescope-nvim
    ] ++ map readNixConfig [
      catppuccin-nvim
    ] ++ [
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      nvim-web-devicons
    ];

    extraLuaConfig = lib.strings.concatLines ([
      "-- nvim-tree"
      "vim.g.loaded_netrw = 1"
      "vim.g.loaded_netrwPlugin = 1"
    ] ++ (map builtins.readFile [
      ./options.lua
      ./mappings.lua
    ]));

    extraPackages = with pkgs; [
      # Language Servers
      ccls
      nodePackages_latest.typescript-language-server
      pyright
      rust-analyzer

      # Formatters
      black
      clang-tools
      nixpkgs-fmt
      nodePackages_latest.prettier
      nodejs
      rustfmt
      stylua

      # telescope.nvim
      ripgrep
    ];
  };
}
