{ config, ... }:
let
  mainUser               = "test";
  currentColorSchemeName = (import ./currentColorScheme.nix ).colorScheme;
in
{
  variables = rec {
    testing.user.name = mainUser;
    testing.test      = "TEST";   ### used in tests.nixos.modules.variables

    inherit currentColorSchemeName;

    users = {
      test = import ../home/test/variables;
    };

    tty = {
      autologin = {
        username = mainUser;
      };
    };

    ###  DO NOT SET ANY OTHER VARIABLES - HAVE TO BE SET IN TEST
  };
}
