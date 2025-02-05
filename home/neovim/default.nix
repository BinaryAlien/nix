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

    extraLuaConfig = lib.strings.concatMapStrings builtins.readFile [
      ./diagnostics.lua
      ./mappings.lua
      ./options.lua
    ];

    extraPackages = with pkgs; [
      # Language Servers
      ccls
      nodePackages_latest.typescript-language-server
      ocamlPackages.ocaml-lsp
      pyright
      rust-analyzer

      # Formatters
      clang-tools
      nixpkgs-fmt
      ocamlPackages.ocamlformat
      prettierd
      ruff
      rustfmt
      stylua

      # prettierd
      nodejs

      # telescope.nvim
      ripgrep
    ];
  };
}
