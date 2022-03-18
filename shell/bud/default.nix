{ pkgs, lib, budUtils, ... }: {
  bud.cmds = with pkgs; {
    get = {
      help     = "Copy the desired template to DEST";
      script   = ./get.bash;
      synopsis = "get [DEST]";
      writer   = budUtils.writeBashWithPaths [ coreutils git nixUnstable ];
    };
    nuke = {
      help     = "removes result and virtualisation-related-files";
      script   = ./nuke.bash;
      synopsis = "nuke";
      writer   = budUtils.writeBashWithPaths [ coreutils     nixUnstable ];
    };
    sburn = {
      help     = "sudo-wrapper for `bud burn`";
      script   = ./sudoBurn.bash;
      synopsis = "burn iso";
      writer   = budUtils.writeBashWithPaths [ coreutils     nixUnstable ];
    };
    tests = {
      help     = "run all tests";
      script   = ./tests.bash;
      synopsis = "tests";
      writer   = budUtils.writeBashWithPaths [ coreutils git nixUnstable ];
    };
  };
}
