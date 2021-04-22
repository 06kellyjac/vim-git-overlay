{
  description = "vim overlay";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
    flake-utils.url = "github:numtide/flake-utils";
    neovim.url = "github:neovim/neovim?dir=contrib";

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
              telescope-media-files-nvim;
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
