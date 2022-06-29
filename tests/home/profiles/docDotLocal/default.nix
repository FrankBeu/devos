{ mkTest
, self
, testHelpers
, ...
}:
let
  host           = self.nixosConfigurations.test;
  username       = host.config.variables.testing.user.name;
  userNameAbbrv  = host.config.variables.users.${username}.abbreviation;
  defaultBrowser = "firefox";

  test = {
    nodes = {
      machine = { suites, profiles, variables, ... }:
      {
        imports = with profiles; [
          services.documentation
        ] ++
        suites.i3 ++
        # suites.debug ++
        [];


        bud.localFlakeClone               = "/home/${username}/DEVOS"; ### documentation relies on the location
        variables.documentation.user.name = username;

        variables = {
          displaymanager = {
            autologin = {
              enabled  = true;
              inherit username;
            };
          };
        };

        home-manager.users.${username} = { profiles, suites, ... }:
        {
          imports = [
            profiles.display.i3
            profiles.docDotLocal
          ];
          variables.users.${username} = {
            abbreviation   = userNameAbbrv;
            defaultBrowser = defaultBrowser;
          };
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
