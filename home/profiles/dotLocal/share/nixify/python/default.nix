{ pkgs ? import <nixpkgs> {} }:
pkgs.poetry2nix.mkPoetryApplication {
    projectDir = ./.;
    # overrides = poetry2nix.overrides.withDefaults (self: super: {
    #   foo = foo.overridePythonAttrs(oldAttrs: {});
    # });
}
