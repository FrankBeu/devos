{ pkgs ? import <nixpkgs> { } }:
let
  pythonEnv = pkgs.poetry2nix.mkPoetryEnv {
    projectDir = ./.;
    python     = pkgs.python3;
    poetrylock = ./poetry.lock;
  };
in
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    # pythonEnv
    poetry
    # yapf
    black
    python39Packages.isort
    python39Packages.debugpy
  ];
}
