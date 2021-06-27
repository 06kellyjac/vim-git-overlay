# This file provides all the buildable packages and package outputs
# in your package set. These are what gets built by CI,
# so if you correctly mark packages as
#
# - broken (using `meta.broken`),
#
# then your CI will be able to build only those packages for which this
# is possible.

{ pkgs ? import <nixpkgs> { overlays = [ (import ./default.nix) ]; } }:

with builtins;

let
  isDerivation = p: isAttrs p && p ? type && p.type == "derivation";
  isBuildable = p: !(p.meta.broken or false) && p.meta.license.free or true;
  shouldRecurseForDerivations = p: isAttrs p && p.recurseForDerivations or false;

  nameValuePair = n: v: { name = n; value = v; };

  concatMap = builtins.concatMap or (f: xs: concatLists (map f xs));

  flattenPkgs = s:
    let
      f = p:
        if shouldRecurseForDerivations p then flattenPkgs p
        else if isDerivation p then [ p ]
        else [ ];
    in
    concatMap f (attrValues s);

  outputsOf = p: map (o: p.${o}) p.outputs;

in

rec {
  buildPkgs = with pkgs.vimPlugins; filter isBuildable [
    pkgs.neovim
    pkgs.neovim-nightly

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
    which-key-nvim

    tree-sitter-go
    tree-sitter-bash
    tree-sitter-bibtex
    tree-sitter-c
    tree-sitter-comment
    tree-sitter-css
    tree-sitter-dockerfile
    tree-sitter-gomod
    tree-sitter-html
    tree-sitter-javascript
    tree-sitter-json
    tree-sitter-latex
    tree-sitter-lua
    tree-sitter-python
    tree-sitter-query
    tree-sitter-rust
    tree-sitter-teal
    tree-sitter-toml
    tree-sitter-typescript
    tree-sitter-tsx
    tree-sitter-yaml
  ];

  buildOutputs = concatMap outputsOf buildPkgs;
}
