{ inputs, toVersion, pkgs }:

let
  inherit (pkgs) lib;

  makeGrammar =
    { includedFiles ? null, parserName, src, version ? "latest", dir ? "src", doGenerate ? false, parentDir ? "", postUnpack ? null }:
    pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = "nvim-treesitter-${parserName}";
      inherit version src;

      nativeBuildInputs = with pkgs;
        [ gcc ] ++
        lib.optional doGenerate [ tree-sitter nodejs-slim ];

      postUnpack = postUnpack;

      preBuild = lib.optional doGenerate ''
        export TREE_SITTER_DIR="$TMPDIR"
        cd ${parentDir}
        tree-sitter generate
        cd -
      '';
      buildPhase = ''
        runHook preBuild
        mkdir -p parser/
        gcc -o parser/${parserName}.so -I$src/${parentDir+dir} $src/${parentDir+dir}/${builtins.concatStringsSep " $src/${parentDir+dir}/" includedFiles} -shared -Os -lstdc++ -fPIC
        runHook postBuild
      '';
    };

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

  mapGrammars = grammarSet: lib.mapAttrs'
    (name: parsers: lib.nameValuePair name (makeGrammar {
      includedFiles = parsers;
      parserName = builtins.elemAt (builtins.split "tree-sitter-()" name) 2;
      src = inputs.${name};
    }))
    grammarSet;

  mapGenGrammars = grammarSet: lib.mapAttrs'
    (name: grammarAttrs: lib.nameValuePair name (makeGrammar {
      includedFiles = grammarAttrs.parsers;
      parentDir = grammarAttrs.parentDir;
      postUnpack = grammarAttrs.postUnpack;
      doGenerate = true;
      parserName = builtins.elemAt (builtins.split "tree-sitter-()" name) 2;
      src = inputs.${name};
    }))
    grammarSet;
in
(mapGrammars {
  tree-sitter-bash = [ "parser.c" "scanner.cc" ];
  tree-sitter-bibtex = [ "parser.c" ];
  tree-sitter-c = [ "parser.c" ];
  tree-sitter-comment = [ "parser.c" "scanner.c" ];
  tree-sitter-css = [ "parser.c" "scanner.c" ];
  tree-sitter-dockerfile = [ "parser.c" ];
  tree-sitter-go = [ "parser.c" ];
  tree-sitter-gomod = [ "parser.c" ];
  tree-sitter-html = [ "parser.c" "scanner.cc" ];
  tree-sitter-javascript = [ "parser.c" "scanner.c" ];
  tree-sitter-json = [ "parser.c" ];
  tree-sitter-latex = [ "parser.c" ];
  tree-sitter-lua = [ "parser.c" "scanner.cc" ];
  tree-sitter-nix = [ "parser.c" "scanner.c" ];
  tree-sitter-python = [ "parser.c" "scanner.cc" ];
  tree-sitter-query = [ "parser.c" ];
  tree-sitter-rust = [ "parser.c" "scanner.c" ];
  tree-sitter-teal = [ "parser.c" "scanner.c" ];
  tree-sitter-toml = [ "parser.c" "scanner.c" ];
  tree-sitter-yaml = [ "parser.c" "scanner.cc" ];
}) //
(mapGenGrammars {
  tree-sitter-typescript = {
    parsers = [ "parser.c" "scanner.c" ];
    parentDir = "typescript/";
    postUnpack = ''
      mkdir node_modules
      cp -r ${inputs.tree-sitter-javascript} node_modules/tree-sitter-javascript
    '';
  };
  tree-sitter-tsx = {
    parsers = [ "parser.c" "scanner.c" ];
    parentDir = "tsx/";
    postUnpack = ''
      mkdir node_modules
      cp -r ${inputs.tree-sitter-javascript} node_modules/tree-sitter-javascript
    '';
  };
})
