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


  /* importTestIfAttributeIsPath walks all attributes (DFS) and imports the test if a path is found */
  importTestIfAttributeIsPath =
    setOfPaths: builtins.mapAttrs (name: value: if builtins.isPath value
                                                then import value { inherit self mkTest;}
                                                else importTestIfAttributeIsPath value ) setOfPaths;

  /* eliminateNestedDuplicatedTestname walks all attributes (DFS) and removes the first of two identical consecutive attributeNames
  ATTRIBUTE.TESTNAME.TESTNAME -> ATTRIBUTE.TESTNAME */
  eliminateNestedDuplicatedTestnames =
    test: builtins.mapAttrs (name: value: if name == builtins.elemAt (builtins.attrNames value) 0
                                            then value.${builtins.elemAt (builtins.attrNames value) 0}
                                            else eliminateNestedDuplicatedTestnames value) test;

  ### TODO write tests after realignment with digga
  /* collectTests uses digga..rakedLeaves to collect all tests from the given path.
  In order to be able to build one of the collected test with the shortest name possible (`nix build .#tests.testName`) some reshaping has to be done.
  1. All paths are collected.
  2. All paths are imported with the required attributes.
  3. Eliminate nested, duplicated testNames:
  Because the automatically created testName (in the testfile based on the test-dirname)
  is identical to the testName created by rakeLeaves (also based on the test-dirname) -
  one of them can be eliminated. */
  collectTests = directoryPath:
  let
    rakedTestPaths    = self.inputs.digga.lib.rakeLeaves   directoryPath;  ### rakedTestPaths = { dirname1 = path1; dirname2 = path2; ... };
    setOfTests        = importTestIfAttributeIsPath        rakedTestPaths; ### tests          = { dirname1 = { dirname1 = { testAttr1 } }; dirname2 ... }       `nix build .#tests.testName.testName`
    allCollectedTests = eliminateNestedDuplicatedTestnames setOfTests;     ### collectTests   = { dirname1 = { testAttr1 }; path.dirname2 = { testAttr2 }; .. } `nix build .#tests.testName`
  in allCollectedTests;

in
{ inherit collectTests; }
