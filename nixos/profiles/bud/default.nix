{ config
, lib
, variables
, ...
}:
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
        b     = ''bud''                                                                   ;### Bud
        ba    = ''cd ${bud.localFlakeClone} && git add .''                                ;### Bud Add
        beu   = ''cd ${bud.localFlakeClone} && nix flake lock --update-input emacsFlake'' ;### Bud EmacsUpdate
        bb    = ''bud rebuild `hostname` build''                                          ;### BudBuild
        bs    = ''bud rebuild `hostname` switch''                                         ;### BudSwitch
        bso   = ''bud rebuild `hostname` switch  --option binary-caches ""''              ;### BudSwitchOffline         ### TODO what is the difference to bsf
        bsf   = ''bud rebuild `hostname` switch  --option substitute false''              ;### BudSwitchsubstituteFalse
        btmpl = ''bud template ''                                                         ;### BudTeMPlate
        bnk   = ''bud nuke''                                                              ;### BudNuke
        bpvm  = ''bud prepvm''                                                            ;### BudPrepVM [HOST|clear]
        bta   = ''bud testRunAll''                                                        ;### BudTestRunAll
        btcb  = ''bud testCreate b''                                                      ;### BudTestCreateBasic   NAME
        btcd  = ''bud testCreate d''                                                      ;### BudTestCreatebuD     NAME
        btcg  = ''bud testCreate g''                                                      ;### BudTestCreateGolden  NAME
        btcs  = ''bud testCreate s''                                                      ;### BudTestCreateSuite   NAME
        btcv  = ''bud testCreate v''                                                      ;### BudTestCreateVariant NAME
        btp   = ''bud testPrebuild''                                                      ;### BudTestPrebuild      NAME
        bt    = ''bud testRun''                                                           ;### BudTestRun <tests.CATEGORY.SUBCATEGORY.TESTNAME>
        bti   = ''bud testInteractive''                                                   ;### BudTestInteractive
        bv    = ''cd ${bud.localFlakeClone} && bud vm''                                   ;### BudVirtualmachine   HOST

        ### ALiasBUd    | find bud               | align=                                           | surround=   | rm'
        albu = '' alias | rg --color=always 'bud'| sd '^(\w)(=)' '$1  $2'| sd '^(\w{2})(=)' '$1 $2' | sd '=' ' = '| sd "'" "" '';
      };
  };
}
