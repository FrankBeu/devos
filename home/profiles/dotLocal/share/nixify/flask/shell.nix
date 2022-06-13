{ pkgs ? import <nixpkgs> { } }:
let
  pythonEnv = pkgs.poetry2nix.mkPoetryEnv {
    projectDir = ./.;
    python     = pkgs.python39;
    poetrylock = ./poetry.lock;
    ### available defaultOverrides will increase, as poetry2nix will mature
    overrides = pkgs.poetry2nix.overrides.withDefaults (self: super: {
      werkzeug = super.werkzeug.overrideAttrs (oldAttrs: rec {
        postPatch = ''
          substituteInPlace src/werkzeug/_reloader.py \
          --replace "rv = [sys.executable]" "return sys.argv"
        '';
        doCheck = false;
      });
    });
  };

in

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pythonEnv
    poetry
    # yapf
    black                          ### https://github.com/psf/black
    python39Packages.isort
    python39Packages.debugpy
  ];

  FLASK_APP   = "app";
  FLASK_ENV   = "development";
  # FLASK_ENV   = "production";
  # FLASK_DEBUG = "1";
}
