{ pkgs, lib, budUtils, ... }: {
  bud.cmds =
    let
      lineBreakWithIndentation = "\n\t\t\t\t";
      lbwi = lineBreakWithIndentation;
    in
    with pkgs; {
      get = {
        help     = "Copy the desired template to DEST";
        script   = ./get.bash;
        synopsis = "get [DEST]";
        writer   = budUtils.writeBashWithPaths [ coreutils git        nixUnstable                       ];
      };
      nuke = {
        help     = "removes result and virtualisation-related-files";
        script   = ./nuke.bash;
        synopsis = "nuke";
        writer   = budUtils.writeBashWithPaths [ coreutils            nixUnstable                       ];
      };
      prepvm = {
        help     = "Print a command to prepare the shell for launching a vm. ${lbwi} After running the bud-command the script can be sourced with 'eval \\`!!\\`'. ${lbwi} 'eval \\`bud prepvm clear\\`' will remove all set QEMU*-ENVS.";
        script   = ./prepvm.bash;
        synopsis = "prepvm HOST";
        writer   = budUtils.writeBashWithPaths [ coreutils            nixUnstable                       ];
      };
      sburn = {
        help     = "sudo-wrapper for `bud burn`";
        script   = ./sudoBurn.bash;
        synopsis = "burn iso";
        writer   = budUtils.writeBashWithPaths [ coreutils            nixUnstable                       ];
      };
      testCreate = {
        help     = "create a test";
        script   = ./testCreate.bash;
        synopsis = "testCreate TYPE LOCATION";
        writer   = budUtils.writeBashWithPaths [ coreutils     gnused nixUnstable shellColorDefinitions ];

      };
      tests = {
        help     = "run all tests";
        script   = ./tests.bash;
        synopsis = "tests";
        writer   = budUtils.writeBashWithPaths [ coreutils git        nixUnstable                       ];
      };
    };
}
