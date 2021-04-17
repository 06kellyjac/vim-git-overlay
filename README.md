# Vim Git Overlay

Provides git variants of vim plugins up to date with master.

There is CI to automatically update the overlay.

It provides a pre-compiled binary cache for NixOS unstable.
To use it add the following line to your nix.conf

Trusted Public Key: `j-k-vim-git-overlay.cachix.org-1:Rc9zsXHXxeIEhD3YBgLcEpvtZaECzZoPp7XY+r4IgkM=`.

[Click here](https://nix.dev/faq.html#how-do-i-add-a-new-binary-cache) for information on how to add a cache on NixOS or just using nix

## Packages provided

To see what packages are tracking master please refer to the second section of inputs in the [flake.nix](./flake.nix) file or the [ci.nix](./ci.nix) file.

To see what git revision or the epoch of the revision's creation you can check the [flake.lock](./flake.lock) file.

The plan for this repo is to just track the ones I'm using in my vim config but I might add plugins on request but zero promises.
For this reason also be prepared for packages to be dropped from this overlay.

## To Use

Add the overlay to your home.nix (home-manager) or configuration.nix (NixOS):

```nix
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/06kellyjac/vim-git-overlay/archive/master.tar.gz;
    }))
  ];
}
```

```nix
{
  pkgs ? import <nixpkgs> {
    overlays = [
      (import (builtins.fetchTarball {
        url = https://github.com/06kellyjac/vim-git-overlay/archive/master.tar.gz;
      }))
    ];
  }
}:
{}
```

If you are using flakes to configure your system, add to your nixpkgs overlays attribute (examples will differ, the following is for home-manager):

```nix
{
  inputs.vim-git-overlay.url = "github:06kellyjac/vim-git-overlay";
  outputs = { self, ... }@inputs:
    let
      overlays = [ inputs.vim-git-overlay.overlay ];
    in
      homeConfigurations = {
        macbook-pro = inputs.home-manager.lib.homeManagerConfiguration {
          configuration = { pkgs, ... }:
            {
              nixpkgs.overlays = overlays;
            };
        };
      };
}
```

Install a package:

```sh
nix-env -iA pkgs.<PACKAGE_NAME>
```

or add to home-manager/configuration.nix.

## See Also

Based on <https://github.com/nix-community/neovim-nightly-overlay> & <https://github.com/06kellyjac/suckless-git-overlay>
