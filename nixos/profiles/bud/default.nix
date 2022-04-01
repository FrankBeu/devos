{ config, lib, variables, ... }:
let
  userName = variables.mainUser.name;
in
{
  bud = {
    enable          = true;
    localFlakeClone = "/home/${userName}/DEVOS";
  };

  environment = {
    shellAliases =
      let
        ifSudo = lib.mkIf config.security.sudo.enable;
      in
      {
        b =  "bud";
        bb = "b   rebuild `hostname` build";
        bs = "b   rebuild `hostname` switch";
      };
  };
}
