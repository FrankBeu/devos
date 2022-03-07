{ self, mkTest, ...}:
let
  ################################################### TEST-CONFIG
  ### TODO set globaly to test with specific host
  host = self.nixosConfigurations.NixOS;
  # host = self.nixosConfigurations.isoBase;

  # meta.timeout = 1800;

  test = {
    nodes = {
      machine =
        { suites, profiles, variables, colorscheme, ... }: {
          # variables = {                                       ### default settings can be overriden
          #   currentColorSchemeName = "dracula";
          # };

          systemd.tmpfiles.rules =
            let
            colors = colorscheme.colors;
            colorTestActual = ''${colors.base00}\n${colors.base01}\n'';
            in
            [
              "f /tmp/colorTestActual - - - - ${colorTestActual}"
            ];
        };
    };

    enableOcr  = false;

    testScript =
      ''
        start_all()

        machine.copy_from_host(
        "${./colorTestTarget}",
        "/tmp/colorTestTarget",
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
