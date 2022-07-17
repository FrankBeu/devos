{ lib }:
with lib;
let
  testRakeLeaves = {
    expr     = rakeLeaves ./profiles;
    expected = {
      f   = ./profiles/f.nix;
      foo = ./profiles/foo;
      t   = {
        bar = ./profiles/t/bar.nix;
        # bar = "test";
      };
    };
  };

  testFlattenTree = {
    expr = flattenTree (rakeLeaves ./profiles);
    expected = {
      f       = ./profiles/f.nix;
      foo     = ./profiles/foo;
      "t.bar" = ./profiles/t/bar.nix;
    };
  };
in
{
  inherit
  testRakeLeaves
  testFlattenTree
  ;
}
