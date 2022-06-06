{ config, lib, variables, ... }:
let
  budLocalFlakeCloneLocation = variables.budLocalFlakeCloneLocation;
in rec
{
  bud = {
    enable          = true;
    localFlakeClone = budLocalFlakeCloneLocation;
  };

  environment = {
    shellAliases =
      let
        ifSudo = lib.mkIf config.security.sudo.enable;
      in
      {
        b     = ''bud''                                                                   ;  ### Bud
        ba    = ''cd ${bud.localFlakeClone} && git add .''                                ;  ### Bud Add
        beu   = ''cd ${bud.localFlakeClone} && nix flake lock --update-input emacsFlake'' ;  ### Bud EmacsUpdate
        bb    = ''bud rebuild `hostname` build''                                          ;  ### BudBuild
        bs    = ''bud rebuild `hostname` switch''                                         ;  ### BudSwitch
        bso   = ''bud rebuild `hostname` switch  --option binary-caches ""''              ;  ### BudSwitchOffline         ### TODO difference to bsf
        bsf   = ''bud rebuild `hostname` switch  --option substitute false''              ;  ### BudSwitchsubstituteFalse
        btmpl = ''bud template ${bud.localFlakeClone}''                                   ;  ### BudTeMPlate
        bn    = ''bud nuke''                                                              ;  ### BudNuke
        bta   = ''bud tests''                                                             ;  ### BudTestsAll
        btb   = ''bud testCreate b''                                                      ;  ### BudTestcreateBasic  NAME
        btg   = ''bud testCreate g''                                                      ;  ### BudTestcreateGolden NAME
        btp   = ''bud testPrebuild''                                                      ;  ### BudTestPrebuild     NAME
        bt    = ''bud testRun''                                                           ;  ### BudTestRun <tests.CATEGORY.SUBCATEGORY.TESTNAME>
        bti   = ''bud testInteractive''                                                   ;  ### BudTestInteractive
        bv    = ''cd ${bud.localFlakeClone} && bud vm''                                   ;  ### BudVirtualmachine   HOST

        ### ALiasBUd    | find bud               | align=                                           | surround=   | rm'
        albu = '' alias | rg --color=always 'bud'| sd '^(\w)(=)' '$1  $2'| sd '^(\w{2})(=)' '$1 $2' | sd '=' ' = '| sd "'" "" '';
      };
  };
}
