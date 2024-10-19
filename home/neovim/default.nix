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
      conform-nvim
      lsp-zero-nvim
      lsp_signature-nvim
      lualine-nvim
      nvim-cmp
      nvim-tree-lua
      nvim-treesitter.withAllGrammars
      telescope-nvim
    ] ++ map readNixConfig [
      catppuccin-nvim
    ] ++ [
      cmp-nvim-lsp
      luasnip
      nvim-lspconfig
      nvim-web-devicons
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
