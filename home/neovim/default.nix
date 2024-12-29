{ lib, pkgs, ... }:
let
  readLuaConfig = plugin: {
    inherit plugin;
    type = "lua";
    config = builtins.readFile ./plugin/${plugin.pname}.lua;
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
      ocamlPackages.ocaml-lsp
      pyright
      rust-analyzer

      # Formatters
      black
      clang-tools
      nixpkgs-fmt
      ocamlPackages.ocamlformat
      prettierd
      rustfmt
      stylua

      # telescope.nvim
      ripgrep
    ];
  };
}
