{ config, ... }:
let
  mainUser               = "nixos";
  currentColorSchemeName = (import ./currentColorScheme.nix ).colorScheme;
in
{
  variables = rec {
    testing.user.name = mainUser;
    testing.test      = "TEST";   ### used in tests.nixos.modules.variables

    inherit currentColorSchemeName;

    users = {
      nixos = import ./nixos/default.nix;
    };

    tty = {
      autologin = {
        username = mainUser;
      };
    };

    ###  DO NOT SET ANY OTHER VARIABLES - HAVE TO BE SET IN TEST
  };
}
