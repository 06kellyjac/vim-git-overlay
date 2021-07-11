{ inputs, toVersion, pkgs }:

let
  inherit (pkgs) lib;

  makeGrammar =
    let
      genParserName = name: builtins.elemAt (builtins.split "tree-sitter-()" name) 2;
    in
    { name
    , src
    , includedFiles ? null
    , parserName ? genParserName name
    , version ? toVersion src.lastModifiedDate
    , dir ? "src"
    , doGenerate ? false
    , parentDir ? ""
    , postUnpack ? null
    }:
    let
      noParser = (lib.findFirst (file: lib.hasPrefix "parser." file) false includedFiles) == false;
    in
    pkgs.vimUtils.buildVimPluginFrom2Nix {
      pname = "nvim-treesitter-${parserName}";
      inherit version src postUnpack;

      nativeBuildInputs = with pkgs;
        [ gcc ] ++
        # If there's no parser file included we need treesitter's parser.h file
        lib.optional noParser [ tree-sitter ] ++
        lib.optional doGenerate [ tree-sitter nodejs-slim ];

      preBuild = lib.optional doGenerate ''
        export TREE_SITTER_DIR="$TMPDIR"
        # fix for issue below until pr below is released:
        # https://github.com/tree-sitter/tree-sitter/issues/1222
        # https://github.com/tree-sitter/tree-sitter/pull/1224
        echo "{}" > "$TREE_SITTER_DIR/config.json"
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

  mapGrammars = grammarSet: lib.mapAttrs'
    (name: parsers: lib.nameValuePair name (
      makeGrammar {
        inherit name;
        src = inputs.${name};
        includedFiles = parsers;
      }
    ))
    grammarSet;

  mapGenGrammars = grammarSet: lib.mapAttrs'
    (name: grammarAttrs: lib.nameValuePair name (
      makeGrammar {
        inherit name;
        src = inputs.${name};
        includedFiles = grammarAttrs.parsers;
        doGenerate = true;
        inherit (grammarAttrs) parentDir postUnpack;
      }
    ))
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
  tree-sitter-teal = [ "scanner.c" ];
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
