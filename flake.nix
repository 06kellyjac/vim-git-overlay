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
    tree-sitter-c = { url = "github:tree-sitter/tree-sitter-c?rev=0aeed5578ad5a50daeb70ca5243da5f3f3d4b23b"; flake = false; };
    tree-sitter-comment = { url = "github:stsewd/tree-sitter-comment?rev=8d480c0a86e3b95812252d29292b2686eb92418d"; flake = false; };
    tree-sitter-css = { url = "github:tree-sitter/tree-sitter-css?rev=a03f1d2d1dfbf6f8e0fdca5f9ff030228241eb57"; flake = false; };
    tree-sitter-dockerfile = { url = "github:camdencheek/tree-sitter-dockerfile?rev=f0b8e6748238ac0a6ba10e360db5b712039db895"; flake = false; };
    tree-sitter-go = { url = "github:tree-sitter/tree-sitter-go?rev=42b1e657c3a394c01df51dd3eadc8b214274a73c"; flake = false; };
    tree-sitter-gomod = { url = "github:camdencheek/tree-sitter-go-mod?rev=2dfd6b7d3a4cfedc52e5eaa3cc497f419e628ebb"; flake = false; };
    tree-sitter-html = { url = "github:tree-sitter/tree-sitter-html?rev=161a92474a7bb2e9e830e48e76426f38299d99d1"; flake = false; };
    tree-sitter-javascript = { url = "github:tree-sitter/tree-sitter-javascript?rev=435db852fbeff8fe298e25ad967c634d9698eec0"; flake = false; };
    tree-sitter-json = { url = "github:tree-sitter/tree-sitter-json?rev=203e239408d642be83edde8988d6e7b20a19f0e8"; flake = false; };
    tree-sitter-latex = { url = "github:latex-lsp/tree-sitter-latex?rev=23463ca6b867e8089d3b680ad720dc8fd26af34e"; flake = false; };
    tree-sitter-lua = { url = "github:nvim-treesitter/tree-sitter-lua?rev=6f5d40190ec8a0aa8c8410699353d820f4f7d7a6"; flake = false; };
    tree-sitter-nix = { url = "github:cstrahan/tree-sitter-nix?rev=83ee5993560bf15854c69b77d92e34456f8fb655"; flake = false; };
    tree-sitter-python = { url = "github:tree-sitter/tree-sitter-python?rev=9b84b7fd9da1aa74c8a8afae58b7dcc4c109cda4"; flake = false; };
    tree-sitter-query = { url = "github:nvim-treesitter/tree-sitter-query?rev=9a2ccff9f672f1f3d320cf925b8e5acc89b27055"; flake = false; };
    tree-sitter-rust = { url = "github:tree-sitter/tree-sitter-rust?rev=afed2747665042e0000cf67213d5a5e8a84c7bcc"; flake = false; };
    tree-sitter-teal = { url = "github:euclidianAce/tree-sitter-teal?rev=fcc5f6f4d194dede4e676834ff28a506e39e17b4"; flake = false; };
    tree-sitter-toml = { url = "github:ikatyang/tree-sitter-toml?rev=8bd2056818b21860e3d756b5a58c4f6e05fb744e"; flake = false; };
    tree-sitter-typescript = { url = "github:tree-sitter/tree-sitter-typescript?rev=8e9dba7bd7cf089838a036a98be94db53ba2d0a9"; flake = false; };
    tree-sitter-tsx = { url = "github:tree-sitter/tree-sitter-typescript?rev=8e9dba7bd7cf089838a036a98be94db53ba2d0a9"; flake = false; };
    tree-sitter-yaml = { url = "github:ikatyang/tree-sitter-yaml?rev=0e36bed171768908f331ff7dff9d956bae016efb"; flake = false; };

    astronauta-nvim = { url = "github:tjdevries/astronauta.nvim"; flake = false; };
    barbar-nvim = { url = "github:romgrk/barbar.nvim"; flake = false; };
    base16-vim = { url = "github:chriskempson/base16-vim"; flake = false; };
    formatter-nvim = { url = "github:mhartington/formatter.nvim"; flake = false; };
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
    mkVimPlugins = pkgs:
      let
        inherit (pkgs) lib;
        toVersion = str: with lib; "${substring 0 4 str}-${substring 4 2 str}-${substring 6 2 str}";

        overridePkgVersionSrc = pkg: version: src: pkg.overrideAttrs (_: { inherit version src; });
        createVimPlugin = pname: version: src: pkgs.vimUtils.buildVimPluginFrom2Nix { inherit pname version src; };

        overrideOrCreateVimPlugin = name: src:
          let
            pkg = pkgs.vimPlugins.${name} or { };
            version = toVersion src.lastModifiedDate;
          in
          if pkg ? overrideAttrs
          then overridePkgVersionSrc pkg version src
          else createVimPlugin name version src;

        mapNightlyVimPlugins = pluginsSet: lib.mapAttrs'
          (name: src: lib.nameValuePair name (overrideOrCreateVimPlugin name src))
          pluginsSet;
      in
      (pkgs.callPackage ./tree-sitter.nix { inherit inputs toVersion pkgs; }) //
        (mapNightlyVimPlugins {
          inherit (inputs)
            astronauta-nvim
            barbar-nvim
            base16-vim
            formatter-nvim
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
            # telescope-frecency-nvim
            # telescope-media-files-nvim
            which-key-nvim;
        });
    overlay = final: prev:
      let
        pkgs = import nixpkgs { overlays = [ neovim.overlay ]; inherit (prev) system config; };
      in
      {
        neovim = pkgs.neovim;
        neovim-nightly = pkgs.neovim;
        vimPlugins = prev.vimPlugins // self.mkVimPlugins prev;
      };
  } // flake-utils.lib.eachDefaultSystem (system:
    let pkgs = import nixpkgs { inherit system; overlays = [ self.overlay ]; }; in
    {
      packages = flake-utils.lib.flattenTree {
        all-modified = pkgs.buildEnv {
          name = "all-modified";
          paths = (pkgs.callPackage ./flake-ci.nix { mkVimPlugins = self.mkVimPlugins; }).buildOutputs;
        };
      };
    }
  );
}
