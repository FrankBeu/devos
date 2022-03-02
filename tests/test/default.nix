{ self, mkTest, ...}:
let

  name = "screenshot";

  host = self.nixosConfigurations.NixOS;

  test = {
    nodes = {
      machine =
      { suites, ... }: {
        imports = suites.base;
      };
    };

    testScript =
      ''
        start_all()
        machine.wait_for_unit("multi-user.target")
        machine.screenshot("postboot")
      '';

    enableOcr = true;

    name = self.inputs.latest.lib.toUpper name;
  };
in
{
  ${name} = mkTest host test;
}
### RUN:
### nix build .#tests.integrationTests.testy.x86_64-linux.screenshot
