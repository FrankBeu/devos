{ lib, self }:
let
  tests  =
    (import ./debugging { inherit lib; }) //
    (import ./digga     { inherit lib; }) //
    ### TODO
    # (import ./testing { inherit lib; }) //
    {};
in
lib.runTests tests
