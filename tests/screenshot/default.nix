{ self, mkTest, ...}:
let
  ################################################### TEST-CONFIG
  host = self.nixosConfigurations.NixOS;

  test = {
    nodes = {
      machine =
        { suites, ... }: {
          imports = suites.base;
        };
    };

    enableOcr  = true;

    testScript =
      ''
        start_all()
        machine.wait_for_unit("multi-user.target")
        machine.screenshot("postboot")
      '';
      ############################################### TEST-CONFIG-END
      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

in
{
  ${name} = mkTest host test;
}
