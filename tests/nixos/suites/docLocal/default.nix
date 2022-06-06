{ mkTest
, self
, testHelpers
, ...
}:
let
  host     = self.nixosConfigurations.NixOS;
  username = host.config.variables.testing.user.name;

  test = {
    nodes = {
      machine = { suites, profiles, variables, ... }:
      {
        imports = with profiles; [
          tools.network ### DEV
        ] ++ suites.docLocal;

        ### KEEP the suite imports bud so the variable has to be set
        variables.budLocalFlakeCloneLocation = "/home/${username}/DEVOS";  ### documentation relies on the location
        variables.documentation.user.name    = username;
      };
    };

    enableOCR  = false;

    testScript =
      ''
        ${testHelpers}
        start_all()
        machine.wait_for_unit("multi-user.target")
        ${testScriptExternal}
      '';

      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

  testScriptExternal = (import ./testScript.nix).testScript;

in
{
  ${name} = mkTest host test;
}
