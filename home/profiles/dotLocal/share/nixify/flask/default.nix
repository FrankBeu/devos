{ pkgs ? import <nixpkgs> {} }:
pkgs.poetry2nix.mkPoetryApplication {
    projectDir = ./.;
    overrides = pkgs.poetry2nix.overrides.withDefaults (self: super: {
      werkzeug = super.werkzeug.overrideAttrs (oldAttrs: rec {
        postPatch = ''
          substituteInPlace src/werkzeug/_reloader.py \
          --replace "rv = [sys.executable]" "return sys.argv"
        '';
        doCheck = false;
      });
    });
}
