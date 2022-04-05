{ self, mkTest, testHelpers, ... }:
let
  host = self.nixosConfigurations.NixOS;

  test = {
    nodes = {
      machine =
        { suites, profiles, variables, ... }: {
          imports = with profiles; [
            autologin.mainUser
            domain.variable
            domain.server
            networking.nameserver.regular
            tools.network                  ### DEV
          ];
        };
    };

    enableOCR  = false;

    testScript =
      ''
        ${testHelpers}
        start_all()
        ${testScriptExternal}
      '';

      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

  domainName = with self; (import "${self}/hosts/NixOS/variables" { inherit config; }).variables.domain;
  testScriptExternal = (import ./testScript.py.nix {inherit domainName;});

in
{
  ${name} = mkTest host test;
}
