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
          alacritty
          filemanager.ranger
        ] ++
        # suites.debug   ++
        suites.i3        ++
        suites.rustTools ++ ### testDependency: procs
        [];

        variables = {
          displaymanager = {
            autologin = {
              enabled  = true;
              inherit username;
            };
          };
        };

        users.users.${username}.shell = pkgs.zsh;### shell has to be set in order to create aliases

        systemd.tmpfiles.rules = [ ( import ./testPreparation.nix { inherit username; }).tmpfiles ];### KEEP (multiline-)string-import

        home-manager.users.${username} = { profiles, suites, ... }:
        {
          imports = with profiles; [
            alacritty
            directoryStructure
            display.i3
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
