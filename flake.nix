{
  description = "vim overlay";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
    flake-utils.url = "github:numtide/flake-utils";
    neovim.url = "github:neovim/neovim/nightly?dir=contrib";
    neovim.inputs.nixpkgs.follows = "nixpkgs";

    tree-sitter-bash = { url = "github:tree-sitter/tree-sitter-bash?rev=7776f24dfa35826fd3038c54a9c311b9e263c22c"; flake = false; };
    tree-sitter-bibtex = { url = "github:latex-lsp/tree-sitter-bibtex?rev=ccfd77db0ed799b6c22c214fe9d2937f47bc8b34"; flake = false; };
    tree-sitter-c = { url = "github:tree-sitter/tree-sitter-c?rev=008008e30a81849fca0c79291e2b480855e0e02c"; flake = false; };
    tree-sitter-comment = { url = "github:stsewd/tree-sitter-comment?rev=894b61d68a31d93c33ed48dcc7f427174b440abe"; flake = false; };
    tree-sitter-css = { url = "github:tree-sitter/tree-sitter-css?rev=94e10230939e702b4fa3fa2cb5c3bc7173b95d07"; flake = false; };
    tree-sitter-dockerfile = { url = "github:camdencheek/tree-sitter-dockerfile?rev=b25f86c3b2ec4192d040432a1a279861df390762"; flake = false; };
    tree-sitter-go = { url = "github:tree-sitter/tree-sitter-go?rev=eb306e6e60f393df346cfc8cbfaf52667a37128a"; flake = false; };
    tree-sitter-gomod = { url = "github:camdencheek/tree-sitter-go-mod?rev=2dfd6b7d3a4cfedc52e5eaa3cc497f419e628ebb"; flake = false; };
    tree-sitter-html = { url = "github:tree-sitter/tree-sitter-html?rev=d93af487cc75120c89257195e6be46c999c6ba18"; flake = false; };
    tree-sitter-javascript = { url = "github:tree-sitter/tree-sitter-javascript?rev=6c8cfae935f67dd9e3a33982e5e06be0ece6399a"; flake = false; };
    tree-sitter-json = { url = "github:tree-sitter/tree-sitter-json?rev=65bceef69c3b0f24c0b19ce67d79f57c96e90fcb"; flake = false; };
    tree-sitter-latex = { url = "github:latex-lsp/tree-sitter-latex?rev=7f720661de5316c0f8fee956526d4002fa1086d8"; flake = false; };
    tree-sitter-lua = { url = "github:nvim-treesitter/tree-sitter-lua?rev=b6d4e9e10ccb7b3afb45018fbc391b4439306b23"; flake = false; };
    tree-sitter-nix = { url = "github:cstrahan/tree-sitter-nix?rev=50f38ceab667f9d482640edfee803d74f4edeba5"; flake = false; };
    tree-sitter-python = { url = "github:tree-sitter/tree-sitter-python?rev=d6210ceab11e8d812d4ab59c07c81458ec6e5184"; flake = false; };
    tree-sitter-query = { url = "github:nvim-treesitter/tree-sitter-query?rev=bc753fa4d8349bd6280f634f57bd6e7be9a3ed17"; flake = false; };
    tree-sitter-rust = { url = "github:tree-sitter/tree-sitter-rust?rev=a360da0a29a19c281d08295a35ecd0544d2da211"; flake = false; };
    tree-sitter-teal = { url = "github:euclidianAce/tree-sitter-teal?rev=1f9562185ef09863a3eee5f5f1ed2858b94c8cda"; flake = false; };
    tree-sitter-toml = { url = "github:ikatyang/tree-sitter-toml?rev=8bd2056818b21860e3d756b5a58c4f6e05fb744e"; flake = false; };
    tree-sitter-typescript = { url = "github:tree-sitter/tree-sitter-typescript?rev=28e757a2f498486931b3cb13a100a1bcc9261456"; flake = false; };
    tree-sitter-tsx = { url = "github:tree-sitter/tree-sitter-typescript?rev=28e757a2f498486931b3cb13a100a1bcc9261456"; flake = false; };
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

  outputs = { self, nixpkgs, neovim, flake-utils, flake-compat, ... }@inputs: {
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
          (prev.callPackage ./tree-sitter.nix { inherit inputs toVersion; pkgs = prev; }) //
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
      } //
      flake-utils.lib.eachDefaultSystem (system:
        let
          pkgs = import nixpkgs { overlays = [ self.overlay neovim.overlay ]; inherit system; };
        in
        { defaultPackage = pkgs; }
      );
  };
}
