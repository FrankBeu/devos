{ mkTest
, self
, testHelpers
, ...
}:
let
  host     = self.nixosConfigurations.test;
  username = host.config.variables.testing.user.name;


  test = {
    nodes = {
      machine = { pkgs, profiles, suites, variables, ... }:
      {
        imports = with profiles; [
        ] ++
        # suites.debug ++
        [];

        users.users.${username}.shell = pkgs.zsh;### shell has to be set in order to create aliases


        home-manager.users.${username} = { profiles, suites, ... }:
        {
          imports = with profiles; [
            directoryStructure
          ];
        };
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

  testScriptExternal = (import ./testScript.py.nix {inherit username;});

in
{
  ${name} = mkTest host test;
}
