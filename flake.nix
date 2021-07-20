{
  description = "vim overlay";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
    flake-utils.url = "github:numtide/flake-utils";
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";
    neovim.url = "github:neovim/neovim?dir=contrib";
    neovim.inputs.nixpkgs.follows = "nixpkgs";
    neovim.inputs.flake-utils.follows = "flake-utils";

    tree-sitter-bash = { url = "github:tree-sitter/tree-sitter-bash?rev=7776f24dfa35826fd3038c54a9c311b9e263c22c"; flake = false; };
    tree-sitter-bibtex = { url = "github:latex-lsp/tree-sitter-bibtex?rev=ccfd77db0ed799b6c22c214fe9d2937f47bc8b34"; flake = false; };
    tree-sitter-c = { url = "github:tree-sitter/tree-sitter-c?rev=008008e30a81849fca0c79291e2b480855e0e02c"; flake = false; };
    tree-sitter-comment = { url = "github:stsewd/tree-sitter-comment?rev=894b61d68a31d93c33ed48dcc7f427174b440abe"; flake = false; };
    tree-sitter-css = { url = "github:tree-sitter/tree-sitter-css?rev=94e10230939e702b4fa3fa2cb5c3bc7173b95d07"; flake = false; };
    tree-sitter-dockerfile = { url = "github:camdencheek/tree-sitter-dockerfile?rev=e10833bfee4a4f348a48c3f735bb3a2b04f6da0f"; flake = false; };
    tree-sitter-go = { url = "github:tree-sitter/tree-sitter-go?rev=eb306e6e60f393df346cfc8cbfaf52667a37128a"; flake = false; };
    tree-sitter-gomod = { url = "github:camdencheek/tree-sitter-go-mod?rev=2dfd6b7d3a4cfedc52e5eaa3cc497f419e628ebb"; flake = false; };
    tree-sitter-html = { url = "github:tree-sitter/tree-sitter-html?rev=af9339f3deb131ab99acfac906713b81dbcc41c9"; flake = false; };
    tree-sitter-javascript = { url = "github:tree-sitter/tree-sitter-javascript?rev=2c5b138ea488259dbf11a34595042eb261965259"; flake = false; };
    tree-sitter-json = { url = "github:tree-sitter/tree-sitter-json?rev=65bceef69c3b0f24c0b19ce67d79f57c96e90fcb"; flake = false; };
    tree-sitter-latex = { url = "github:latex-lsp/tree-sitter-latex?rev=2c0d03a36ee979bc697f6a9dd119174cf0ef15e0"; flake = false; };
    tree-sitter-lua = { url = "github:nvim-treesitter/tree-sitter-lua?rev=b6d4e9e10ccb7b3afb45018fbc391b4439306b23"; flake = false; };
    tree-sitter-nix = { url = "github:cstrahan/tree-sitter-nix?rev=50f38ceab667f9d482640edfee803d74f4edeba5"; flake = false; };
    tree-sitter-python = { url = "github:tree-sitter/tree-sitter-python?rev=d6210ceab11e8d812d4ab59c07c81458ec6e5184"; flake = false; };
    tree-sitter-query = { url = "github:nvim-treesitter/tree-sitter-query?rev=9a2ccff9f672f1f3d320cf925b8e5acc89b27055"; flake = false; };
    tree-sitter-rust = { url = "github:tree-sitter/tree-sitter-rust?rev=a360da0a29a19c281d08295a35ecd0544d2da211"; flake = false; };
    tree-sitter-teal = { url = "github:euclidianAce/tree-sitter-teal?rev=85d8a3b1e23f74495d1125c441d33af5f28c9dea"; flake = false; };
    tree-sitter-toml = { url = "github:ikatyang/tree-sitter-toml?rev=8bd2056818b21860e3d756b5a58c4f6e05fb744e"; flake = false; };
    tree-sitter-typescript = { url = "github:tree-sitter/tree-sitter-typescript?rev=fd08586b72f2ba8776d865b32aca561285c10cfd"; flake = false; };
    tree-sitter-tsx = { url = "github:tree-sitter/tree-sitter-typescript?rev=fd08586b72f2ba8776d865b32aca561285c10cfd"; flake = false; };
    tree-sitter-yaml = { url = "github:ikatyang/tree-sitter-yaml?rev=0e36bed171768908f331ff7dff9d956bae016efb"; flake = false; };

    barbar-nvim = { url = "github:romgrk/barbar.nvim"; flake = false; };
    base16-vim = { url = "github:chriskempson/base16-vim"; flake = false; };
    galaxyline-nvim = { url = "github:glepnir/galaxyline.nvim"; flake = false; };
    lspsaga-nvim = { url = "github:glepnir/lspsaga.nvim"; flake = false; };
    nvcode-color-schemes-vim = { url = "github:ChristianChiarulli/nvcode-color-schemes.vim"; flake = false; };
    nvim-colorizer-lua = { url = "github:norcalli/nvim-colorizer.lua"; flake = false; };
    nvim-compe = { url = "github:hrsh7th/nvim-compe"; flake = false; };
    nvim-lspconfig = { url = "github:neovim/nvim-lspconfig"; flake = false; };
    nvim-tree-lua = { url = "github:kyazdani42/nvim-tree.lua"; flake = false; };
    nvim-treesitter = { url = "github:nvim-treesitter/nvim-treesitter"; flake = false; };
    nvim-web-devicons = { url = "github:kyazdani42/nvim-web-devicons"; flake = false; };
    plenary-nvim = { url = "github:nvim-lua/plenary.nvim"; flake = false; };
    popup-nvim = { url = "github:nvim-lua/popup.nvim"; flake = false; };
    telescope-frecency-nvim = { url = "github:nvim-telescope/telescope-frecency.nvim"; flake = false; };
    telescope-media-files-nvim = { url = "github:nvim-telescope/telescope-media-files.nvim"; flake = false; };
    which-key-nvim = { url = "github:folke/which-key.nvim"; flake = false; };
  };

  outputs = { self, nixpkgs, nur, neovim, flake-utils, flake-compat, ... }@inputs: {
    overlay = final: prev:
      let
        pkgs = import nixpkgs { overlays = [ neovim.overlay ]; inherit (prev) system config; };

        inherit (prev) lib;
        toVersion = str: with lib; "${substring 0 4 str}-${substring 4 2 str}-${substring 6 2 str}";

        overridePkgVersionSrc = pkg: version: src: pkg.overrideAttrs (_: { inherit version src; });
        createVimPlugin = pname: version: src: prev.vimUtils.buildVimPluginFrom2Nix { inherit pname version src; };

        overrideOrCreateVimPlugin = name: src:
          let
            pkg = prev.vimPlugins.${name} or { };
            version = toVersion src.lastModifiedDate;
          in
          if pkg ? overrideAttrs
          then overridePkgVersionSrc pkg version src
          else createVimPlugin name version src;

        mapNightlyVimPlugins = pluginsSet: lib.mapAttrs'
          (name: src: lib.nameValuePair name (overrideOrCreateVimPlugin name src))
          pluginsSet;
      in
      {
        neovim = pkgs.neovim;
        neovim-nightly = pkgs.neovim;
        vimPlugins =
          prev.vimPlugins //
          (prev.callPackage ./tree-sitter.nix { inherit inputs toVersion pkgs; }) //
          (mapNightlyVimPlugins {
            inherit (inputs)
              barbar-nvim
              base16-vim
              galaxyline-nvim
              lspsaga-nvim
              nvcode-color-schemes-vim
              nvim-colorizer-lua
              nvim-compe
              nvim-lspconfig
              nvim-tree-lua
              nvim-treesitter
              nvim-web-devicons
              plenary-nvim
              popup-nvim
              telescope-frecency-nvim
              telescope-media-files-nvim
              which-key-nvim;
          });
      };
  };
}
