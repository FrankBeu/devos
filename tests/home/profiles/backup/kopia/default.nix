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
        imports = [
          profiles.shell.zsh
        ] ++
        # suites.debug ++
        [];

        bud.localFlakeClone               = "/home/${username}/DEVOS"; ### documentation relies on the location
        users.users.${username}.shell     = pkgs.zsh;
        variables.documentation.user.name = username;

        home-manager.users.${username} = { profiles, suites, ... }:
        {
          imports = with profiles; [
            profiles.backup.kopia
          ] ++
          suites.zsh ++
          [];
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

  hmProfileDir       = host.config.home-manager.users.${username}.home.profileDirectory;
  testScriptExternal = (import ./testScript.py.nix {inherit hmProfileDir username;});

in
{
  ${name} = mkTest host test;
}
