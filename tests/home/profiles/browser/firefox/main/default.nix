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
      machine = { suites, profiles, variables, ... }:
      {
        imports = with profiles; [
          tools.zip          ### testDependency: unzip
          core               ### testDependency: fd
        ] ++
        # suites.debug ++
        [];

        home-manager.users.${username} = { profiles, suites, ... }:
        {
          imports = with profiles; [
            browser.firefox.main
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


  hmProfileDir       = host.config.home-manager.users.${username}.home.profileDirectory + "/bin";
  testScriptExternal = (import ./testScript.py.nix { inherit hmProfileDir username; });

in
{
  ${name} = mkTest host test;
}
