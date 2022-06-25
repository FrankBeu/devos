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
      machine = { pkgs, profiles, suites, ... }:
      {
        imports = [
          profiles.shell.zsh
          profiles.core

          profiles.fonts
        ] ++
        suites.i3 ++
        # suites.debug ++
        [];

        variables = {
          displaymanager = {
            autologin = {
              enabled  = true;
              inherit username;
            };
          };
        };

        users.users.${username}.shell = pkgs.zsh;

        home-manager.users.${username} = { profiles, suites, ... }:
        {
          imports = [
            profiles.alacritty
            profiles.display.i3
          ] ++
          suites.zsh ++
          [];

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

  testScriptExternal = builtins.readFile ./testScript.py;

in
{
  ${name} = mkTest host test;
}
