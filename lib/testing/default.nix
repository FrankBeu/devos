{ self, lib }:
let

  maybeImport = obj:

  if (builtins.isPath obj) then
  ### TODO -> upstream
  # if (builtins.isPath obj || builtins.isString obj) then
  import obj
  else obj
  ;

  maybeCallTest = pkgs: obj:
  if lib.isFunction obj then
  pkgs.callPackage obj { }
  else obj
  ;

  mkTest = host: test:
  let
    pkgs = host._module.args.pkgs;
    nixosTesting =
      (import "${toString pkgs.path}/nixos/lib/testing-python.nix" {
        inherit pkgs;
        inherit (pkgs) system;
        inherit (host.config.lib) specialArgs;
        extraConfigurations = host._module.args.modules;
      });
  in
  nixosTesting.makeTest (maybeCallTest pkgs (maybeImport test));


  /* collectTests uses digga..rakedLeaves to collect all tests from the given path.
  In order to be able to build one of the collected test with the shortest name possible (`nix build .#tests.testName`) some reshaping has to be done.
  1. All paths are collected.
  2. All paths are imported with the required attributes.
  3. Eliminate nested, duplicated attributeNames:
      Because the automatically (in the testfile) created testname (based on the test-dirname)
      is identical to the attributeName created by rakeLeaves (also based on the test-dirname) -
      one can be eliminated. */
  collectTests = directoryPath:
  let
    rakedTestPaths = self.inputs.digga.lib.rakeLeaves directoryPath;                                      ### rakedTestPaths = { dirname1 = path1;  dirname2 = path2; ... };
    tests          = builtins.mapAttrs (name: path: import path { inherit self mkTest;} ) rakedTestPaths; ### tests          = { dirname1  = { dirname1 = { testAttr1 } }; dirname2 ... } `nix build .#tests.testName.testName`
  in builtins.mapAttrs (name: value: value.${builtins.elemAt (builtins.attrNames value) 0} ) tests;       ### collectTests   = { dirname1 = { testAttr1 }; dirname2 = { testAttr2 }; .. } `nix build .#tests.testName`

in
{ inherit collectTests; }
