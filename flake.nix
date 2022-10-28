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

    tree-sitter-bash = { url = "github:tree-sitter/tree-sitter-bash?rev=f1a86d3cc5aeeb67e0e52442e893af7f813025b4"; flake = false; };
    tree-sitter-bibtex = { url = "github:latex-lsp/tree-sitter-bibtex?rev=ccfd77db0ed799b6c22c214fe9d2937f47bc8b34"; flake = false; };
    tree-sitter-c = { url = "github:tree-sitter/tree-sitter-c?rev=7175a6dd5fc1cee660dce6fe23f6043d75af424a"; flake = false; };
    tree-sitter-comment = { url = "github:stsewd/tree-sitter-comment?rev=a37ca370310ac6f89b6e0ebf2b86b2219780494e"; flake = false; };
    tree-sitter-css = { url = "github:tree-sitter/tree-sitter-css?rev=a03f1d2d1dfbf6f8e0fdca5f9ff030228241eb57"; flake = false; };
    tree-sitter-dockerfile = { url = "github:camdencheek/tree-sitter-dockerfile?rev=25c71d6a24cdba8f0c74ef40d4d2d93defd7e196"; flake = false; };
    tree-sitter-go = { url = "github:tree-sitter/tree-sitter-go?rev=aeb2f33b366fd78d5789ff104956ce23508b85db"; flake = false; };
    tree-sitter-gomod = { url = "github:camdencheek/tree-sitter-go-mod?rev=2dfd6b7d3a4cfedc52e5eaa3cc497f419e628ebb"; flake = false; };
    tree-sitter-html = { url = "github:tree-sitter/tree-sitter-html?rev=29f53d8f4f2335e61bf6418ab8958dac3282077a"; flake = false; };
    tree-sitter-javascript = { url = "github:tree-sitter/tree-sitter-javascript?rev=785831303ce3d36f5dd8ada7c4c7d63518d4d2f5"; flake = false; };
    tree-sitter-json = { url = "github:tree-sitter/tree-sitter-json?rev=73076754005a460947cafe8e03a8cf5fa4fa2938"; flake = false; };
    tree-sitter-latex = { url = "github:latex-lsp/tree-sitter-latex?rev=104a5dea952d5f00150afd6a8436e6cad95ef718"; flake = false; };
    tree-sitter-lua = { url = "github:nvim-treesitter/tree-sitter-lua?rev=6f5d40190ec8a0aa8c8410699353d820f4f7d7a6"; flake = false; };
    tree-sitter-nix = { url = "github:cstrahan/tree-sitter-nix?rev=6b71a810c0acd49b980c50fc79092561f7cee307"; flake = false; };
    tree-sitter-python = { url = "github:tree-sitter/tree-sitter-python?rev=b14614e2144b8f9ee54deed5a24f3c6f51f9ffa8"; flake = false; };
    tree-sitter-query = { url = "github:nvim-treesitter/tree-sitter-query?rev=0695cd0760532de7b54f23c667d459b5d1332b44"; flake = false; };
    tree-sitter-rust = { url = "github:tree-sitter/tree-sitter-rust?rev=36ae187ed6dd3803a8a89dbb54f3124c8ee74662"; flake = false; };
    tree-sitter-teal = { url = "github:euclidianAce/tree-sitter-teal?rev=fcc5f6f4d194dede4e676834ff28a506e39e17b4"; flake = false; };
    tree-sitter-toml = { url = "github:ikatyang/tree-sitter-toml?rev=8bd2056818b21860e3d756b5a58c4f6e05fb744e"; flake = false; };
    tree-sitter-typescript = { url = "github:tree-sitter/tree-sitter-typescript?rev=0ab9d99867435a7667c5548a6617a6bf73dbd830"; flake = false; };
    tree-sitter-tsx = { url = "github:tree-sitter/tree-sitter-typescript?rev=0ab9d99867435a7667c5548a6617a6bf73dbd830"; flake = false; };
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
