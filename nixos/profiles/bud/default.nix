{ config
, lib
, pkgs
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
        b     =      ''bud''                                                                         ;### Bud
        ba    = ''cd ${bud.localFlakeClone} && git add .''                                           ;### Bud Add
        beu   = ''cd ${bud.localFlakeClone} && nix flake lock --update-input emacsFlake''            ;### Bud EmacsUpdate
        bb    =      ''bud rebuild `hostname` build''                                                ;### BudBuild
        bs    =      ''bud rebuild `hostname` switch''                                               ;### BudSwitch
        bsnc  =      ''bud rebuild `hostname` switch  --option binary-caches ""''                    ;### BudSwitchNoCaches      ### TODO what is the difference to bso
        bso   =      ''bud rebuild `hostname` switch  --option substitute false''                    ;### BudSwitchOffline
        btmpl =      ''bud template ''                                                               ;### BudTeMPlate
        bnk   =      ''bud nuke''                                                                    ;### BudNuke
        bpvm  =      ''bud prepvm''                                                                  ;### BudPrepVM [HOST|clear]
        bta   =      ''bud testRunAll''                                                              ;### BudTestRunAll
        btcb  =      ''bud testCreate b''                                                            ;### BudTestCreateBasic     NAME
        btcd  =      ''bud testCreate d''                                                            ;### BudTestCreatebuD       NAME
        btcg  =      ''bud testCreate g''                                                            ;### BudTestCreateGolden    NAME
        btcs  =      ''bud testCreate s''                                                            ;### BudTestCreateSuite     NAME
        btcv  =      ''bud testCreate v''                                                            ;### BudTestCreateVariant   NAME
        btp   =      ''bud testPrebuild''                                                            ;### BudTestPrebuild        NAME
        btpo  =  ''(){ bud testPrebuild "''${@}" --option substitute false                       ;}'';### BudTestPrebuildOffline <tests.CATEGORY.SUBCATEGORY.TESTNAME> [OTHER-NIX-OPTIONS]
        btpio =  ''(){ bud testPrebuild "''${@}" --option substitute false && bud testInteractive;}'';### BudTestPrebuildrunInteractivelyOffline <tests.CATEGORY.SUBCATEGORY.TESTNAME> [OTHER-NIX-OPTIONS]
        btpi  =  ''(){ bud testPrebuild "''${@}"                           && bud testInteractive;}'';### BudTestPrebuildrunInteractively        <tests.CATEGORY.SUBCATEGORY.TESTNAME> [OTHER-NIX-OPTIONS]
        bt    =      ''bud testRun''                                                                 ;### BudTestrun        <tests.CATEGORY.SUBCATEGORY.TESTNAME>
        bto   =  ''(){ bud testRun      "''${@}" --option substitute false                       ;}'';### BudTestrunOffline <tests.CATEGORY.SUBCATEGORY.TESTNAME> [OTHER-NIX-OPTIONS]
        bti   =      ''bud testInteractive''                                                         ;### BudTestInteractive
        bv    = ''cd ${bud.localFlakeClone} && bud vm''                                              ;### BudVirtualmachine   HOST

        ### ALiasBUd    | find bud               | align=                                           | surround=   | rm'
        albu = '' alias | rg --color=always 'bud'| sd '^(\w)(=)' '$1  $2'| sd '^(\w{2})(=)' '$1 $2' | sd '=' ' = '| sd "'" "" '';
      };

    systemPackages = with pkgs; [
      nixos-generators
    ];
  };
}
