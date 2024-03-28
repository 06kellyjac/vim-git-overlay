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
    tree-sitter-c = { url = "github:tree-sitter/tree-sitter-c?rev=72084f447c2051e01a7cd6c6e0477ec71a9297ed"; flake = false; };
    tree-sitter-comment = { url = "github:stsewd/tree-sitter-comment?rev=a37ca370310ac6f89b6e0ebf2b86b2219780494e"; flake = false; };
    tree-sitter-css = { url = "github:tree-sitter/tree-sitter-css?rev=02b4ee757654b7d54fe35352fd8e53a8a4385d42"; flake = false; };
    tree-sitter-dockerfile = { url = "github:camdencheek/tree-sitter-dockerfile?rev=33e22c33bcdbfc33d42806ee84cfd0b1248cc392"; flake = false; };
    tree-sitter-go = { url = "github:tree-sitter/tree-sitter-go?rev=e34b8a418c33bba8bdf3375e8e55903dff7c68b9"; flake = false; };
    tree-sitter-gomod = { url = "github:camdencheek/tree-sitter-go-mod?rev=2dfd6b7d3a4cfedc52e5eaa3cc497f419e628ebb"; flake = false; };
    tree-sitter-html = { url = "github:tree-sitter/tree-sitter-html?rev=29f53d8f4f2335e61bf6418ab8958dac3282077a"; flake = false; };
    tree-sitter-javascript = { url = "github:tree-sitter/tree-sitter-javascript?rev=de1e682289a417354df5b4437a3e4f92e0722a0f"; flake = false; };
    tree-sitter-json = { url = "github:tree-sitter/tree-sitter-json?rev=3b129203f4b72d532f58e72c5310c0a7db3b8e6d"; flake = false; };
    tree-sitter-latex = { url = "github:latex-lsp/tree-sitter-latex?rev=1ec3941b971dccfa36cb1cd6221a2e4a1cd3e250"; flake = false; };
    tree-sitter-lua = { url = "github:nvim-treesitter/tree-sitter-lua?rev=6f5d40190ec8a0aa8c8410699353d820f4f7d7a6"; flake = false; };
    tree-sitter-nix = { url = "github:cstrahan/tree-sitter-nix?rev=6b71a810c0acd49b980c50fc79092561f7cee307"; flake = false; };
    tree-sitter-python = { url = "github:tree-sitter/tree-sitter-python?rev=9e53981ec31b789ee26162ea335de71f02186003"; flake = false; };
    tree-sitter-query = { url = "github:nvim-treesitter/tree-sitter-query?rev=0695cd0760532de7b54f23c667d459b5d1332b44"; flake = false; };
    tree-sitter-rust = { url = "github:tree-sitter/tree-sitter-rust?rev=3a56481f8d13b6874a28752502a58520b9139dc7"; flake = false; };
    tree-sitter-teal = { url = "github:euclidianAce/tree-sitter-teal?rev=1ae8c68e90523b26b93af56feb7868fe4214e2b2"; flake = false; };
    tree-sitter-toml = { url = "github:ikatyang/tree-sitter-toml?rev=8bd2056818b21860e3d756b5a58c4f6e05fb744e"; flake = false; };
    tree-sitter-typescript = { url = "github:tree-sitter/tree-sitter-typescript?rev=faad9094f4061a43d4e9005439e9e85c6541ebe7"; flake = false; };
    tree-sitter-tsx = { url = "github:tree-sitter/tree-sitter-typescript?rev=faad9094f4061a43d4e9005439e9e85c6541ebe7"; flake = false; };
    tree-sitter-yaml = { url = "github:ikatyang/tree-sitter-yaml?rev=10c6c7a69dde767ad229e1510e0c1c7aacd8c83a"; flake = false; };

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
