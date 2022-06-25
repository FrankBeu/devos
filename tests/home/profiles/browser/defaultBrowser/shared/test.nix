{ mkTest
, name
, self
, testHelpers
, defaultBrowser
, ...
}:
let
  host          = self.nixosConfigurations.test;
  username      = host.config.variables.testing.user.name;
  userNameAbbrv = host.config.variables.users.${username}.abbreviation;

  test = {
    nodes = {
      machine = { lib, suites, profiles, variables, ... }:
      {
        imports = [
        ] ++
        # suites.debug ++
        [];

        bud.localFlakeClone                        = "/home/${username}/DEVOS"; ### documentation relies on the location
        variables.documentation.user.name          = username;


        home-manager.users.${username} = { profiles, suites, variables, ... }:
        {
          imports = [
            profiles.browser.chromium
            profiles.browser.firefox.main

            profiles.browser.defaultBrowser
          ];

          ### TODO WHY?? dynamic attribute 'test' already defined
          ### TODO WHY?? has abbreviation to be set again
          # variables.users.${username}.defaultBrowser = defaultBrowser;
          # variables.users.${username}.abbreviation   = "tt";
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

  testScriptExternal = (import ./testScript.py.nix {inherit defaultBrowser username;});
in
{
  inherit host test;
}
