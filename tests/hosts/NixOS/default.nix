# TODO check user nixos and root
{ self, mkTest, ...}:
let
  ################################################### TEST-CONFIG
  host = self.nixosConfigurations.NixOS;

  # meta.timeout = 1800;
  # meta.timeout = 50;

  test = {
    nodes = {
      machine =
        { ... }: {};
    };

    enableOcr  = true;
    ############################################### TEST-CONFIG-END

    testScript =
      ''
        start_all()
        ${testScriptExternal}
      '';

      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

  testScriptExternal = builtins.readFile ./testScript.py;

in
{
  ${name} = mkTest host test;
}
