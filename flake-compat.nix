(import
  (
    let flake-compat = (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.flake-compat.locked; in
    fetchTarball {
      url = "https://github.com/edolstra/flake-compat/archive/${flake-compat.rev}.tar.gz";
      sha256 = flake-compat.narHash;
    }
  )
  { src = ./.; }).defaultNix
