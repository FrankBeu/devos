{ self }:
let
  ### use modified mkTest based on digga
  ### TODO -> upstream changes
  lib = self.inputs.digga.inputs.nixlib.lib;
  mkTest = (import ../lib/testing { inherit lib; }).mkTest;

  rakedTestPaths = self.inputs.digga.lib.rakeLeaves ./. ;                                               ### rakedTestPaths = { dirname = path; ... };
  tests          = builtins.mapAttrs (name: path: import path { inherit self mkTest;} ) rakedTestPaths; ### tests          = { dirname = { dirname = { testAttr } }; ... }

in builtins.mapAttrs (name: value: value.${builtins.elemAt (builtins.attrNames value) 0} ) tests
# in collectTests ./.
