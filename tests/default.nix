{ self, inputs, digga, ... }:
{
  integrationTests = digga.lib.eachDefaultSystem (system: {
    ### TODO register tests automatically with inputs.digga.lib.rakeLeaves
    test = (import ./pythonTest { inherit inputs system; });
  });
}
