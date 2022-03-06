{ self, mkTest, ...}:
let
  ################################################### TEST-CONFIG
  host = self.nixosConfigurations.NixOS;

  # meta.timeout = 1800;

  test = {
    nodes = {
      machine =
        { suites, profiles, variables, ... }: {
          # variables = {
          #   test  = "TEST";
          #   test2 = "TEST2";
          # };

          systemd.tmpfiles.rules =
            let 
            variablesTestActual = ''${variables.test}\n${variables.test2}\n'';
            in 
            [
              "f /tmp/variablesTestActual - - - - ${variablesTestActual}"
            ];
        };
    };

    enableOcr  = false;

    testScript =
      ''
        start_all()

        machine.copy_from_host(
        "${./variablesTestTarget}",
        "/tmp/variablesTestTarget",
        )

        ${testScriptExternal}

      '';
      ############################################### TEST-CONFIG-END

      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

  testScriptExternal = builtins.readFile ./testScript.py;

in
{
  ${name} = mkTest host test;
}
