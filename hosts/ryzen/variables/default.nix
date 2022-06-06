{ config, ... }:
### TODO really needed??
let
  mainUser               = "frank";
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

    budLocalFlakeCloneLocation = "/home/${mainUser}/DEVOS";

    inherit currentColorSchemeName;

    users = {
      frank = import ./frank/default.nix;
    };

    testing.test = "TEST";   ### used in tests.nixos.modules.variables
  };
}
