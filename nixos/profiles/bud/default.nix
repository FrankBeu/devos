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
        b   = "bud";                         ### Bud
        bb  = "b rebuild `hostname` build";  ### BudBuild
        bs  = "b rebuild `hostname` switch"; ### BudSwitch
        bt  = "b tests";                     ### BudTests
        btb = "b testCreate b ";             ### BudTestcreateBasic  NAME
        btg = "b testCreate g ";             ### BudTestcreateGolden NAME
        bv  = "b vm";                        ### BudVirtualmachine   HOST
      };
  };
}
