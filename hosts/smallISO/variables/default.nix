{ config, ... }:
### TODO really needed??
let
  mainUser               = "test";
  currentColorSchemeName = (import ./currentColorScheme.nix ).colorScheme;
in
{
  variables = rec {

    shell     = "zsh";

    tty = {
      autologin = {
        username = mainUser;
      };
    };

    displaymanager = {
      autologin = {
        enabled  = true;
        username = mainUser;
      };
    };

    ### TODO create specific documentation for each user
    testing.user.name       = mainUser;  ### used to specify the user used in tests
    documentation.user.name = mainUser;
    manualActions.user.name = mainUser;

    budLocalFlakeCloneLocation = "/home/${mainUser}/DEVOS";

    inherit currentColorSchemeName;

    publicSSHKeys = false;### TODO make default when variables are typed

    ### TODO collect from ../home.nix
    users = {
      test = import ./test/default.nix;
    };

    testing.test = "TEST";   ### used in tests.nixos.modules.variables

    domain = "thesym.site";
  };
}
