channels: final: prev: {

  __dontExport = true; # overrides clutter up actual creations

  # nix is set to 2.3 in 21.11
  nix-direnv = prev.nix-direnv.override { nix = prev.nixUnstable; };

  haskellPackages = prev.haskellPackages.override
    (old: {
      overrides = prev.lib.composeExtensions (old.overrides or (_: _: { })) (hfinal: hprev:
        let version = prev.lib.replaceChars [ "." ] [ "" ] prev.ghc.version;
        in
        {
          # same for haskell packages, matching ghc versions
          inherit (channels.latest.haskell.packages."ghc${version}")
            haskell-language-server;
        });
    });
}
