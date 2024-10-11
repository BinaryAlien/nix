{ pkgs, ... } @ extraArgs:
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
      nvim-treesitter.withAllGrammars
      lualine-nvim
      telescope-nvim
      nvim-tree-lua
      conform-nvim
      nvim-cmp
      lsp-zero-nvim
    ] ++ map readNixConfig [
      catppuccin-nvim
    ] ++ [
      nvim-web-devicons
      nvim-lspconfig
      cmp-nvim-lsp
      luasnip
    ];

    extraLuaConfig = builtins.readFile ./options.lua;

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

      # Telescope
      ripgrep
    ];
  };
}
