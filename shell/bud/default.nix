{ pkgs, lib, budUtils, ... }: {
  bud.cmds =
    let
      help-indentation        = "\t\t\t\t\t";
      hi                      = help-indentation;
      ### TODO create loop for description creating the indentation in bud
      description-indentation = "  ";
      di                      = description-indentation;
      ### TODO combine with shellColorDefinitions -> flake
      ### TODO use in system as shell-colors and in bud-flake and here as nix-colors
      ### TODO with colorModule
      ### TODO find solution without the need to set indentation in cmds
      ### use colors like \\${B}
      BR = "\u001b[30m";    ### Black
      CR = "\u001b[36m";    ### Cyan    Reg   category
      GR = "\u001b[32m";    ### Green   Reg   success,good
      MR = "\u001b[35m";    ### Magenta Reg
      RR = "\u001b[31m";    ### Red     Reg   error,danger,stop
      UR = "\u001b[34m";    ### blUe    Reg   stability,calm
      WR = "\u001b[37m";    ### White   Reg
      YR = "\u001b[33m";    ### Yellow  Reg   proceed with caution,warning, in progress
      BB = "\u001b[30;1m";  ### Black   Bold
      CB = "\u001b[36;1m";  ### Cyan    Bold
      GB = "\u001b[32;1m";  ### Green   Bold  success,good
      MB = "\u001b[35;1m";  ### Magenta Bold
      RB = "\u001b[31;1m";  ### Red     Bold  error,danger,stop
      UB = "\u001b[34;1m";  ### blUe    Bold  stability,calm
      WB = "\u001b[37;1m";  ### White   Bold
      YB = "\u001b[33;1m";  ### Yellow  Bold  proceed with caution,warning, in progress
      NE = "\u001b[0m";     ### NoEffects
    in
    with pkgs; {
      get = {
        description = ''Example command: get DEVOS from github'';
        help        = "Copy the desired template to DEST";
        script      = ./get.bash;
        synopsis    = "get [DEST]";
        writer      = budUtils.writeBashWithPaths [ coreutils git        nixUnstable                            ];
      };

      colors = {
        description = ''
          \\${NE}### Black   Reg   invisible (made visible)                        \\${NE}
          ${di}\\${CR}### Cyan    Reg   emphasis                                        \\${NE}
          ${di}\\${GR}### Green   Reg   success,good                                    \\${NE}
          ${di}\\${MR}### Magenta Reg   emphasis                                        \\${NE}
          ${di}\\${RR}### Red     Reg   error,danger,stop                               \\${NE}
          ${di}\\${UR}### blUe    Reg   stability,calm                                  \\${NE}
          ${di}\\${WR}### White   Reg   regular                                         \\${NE}
          ${di}\\${YR}### Yellow  Reg   proceed with caution,warning, in progress       \\${NE}
          ${di}\\${BB}### Black   Bold  comment                                         \\${NE}
          ${di}\\${CB}### Cyan    Bold  emphasis                                        \\${NE}
          ${di}\\${GB}### Green   Bold  success,good                                    \\${NE}
          ${di}\\${MB}### Magenta Bold  emphasis                                        \\${NE}
          ${di}\\${RB}### Red     Bold  error,danger,stop                               \\${NE}
          ${di}\\${UB}### blUe    Bold  stability,calm                                  \\${NE}
          ${di}\\${WB}### White   Bold  category                                        \\${NE}
          ${di}\\${YB}### Yellow  Bold  proceed with caution,warning, in progress       \\${NE}'';
        help        =
          ''Use '\\${MB}bud colors help\\${NE}' to view all colors available to bud and their usage.
          ${hi}Call '\\${MB}bud colors\\${NE}'   to view all colors defined in shellColorDefinitions.'';
        script      = ./colors.bash;
        synopsis    = "colors";
        writer      = budUtils.writeBashWithPaths [ coreutils            nixUnstable shellColorDefinitions      ];
      };

      nuke = {
        description = ''Remove ''${FLAKEROOT}/*.qcow2 and ''${FLAKEROOT}/result recursively. Used to clean up DEVOS, to ensure clean vms'';
        help        = "removes result and virtualisation-related-files";
        script      = ./nuke.bash;
        synopsis    = "nuke";
        writer      = budUtils.writeBashWithPaths [ coreutils            nixUnstable                            ];
      };

      prepvm = {
        description = ''Because bud runs the prepvm script in a subshell,
        variables cannot be sourced. Instead a statement is printed to the cli,
        which can be sourced to add the defined variables to the current shell.'';
        help        =
        ''Print a command to prepare the shell for launching a vm.
          ${hi}After running the bud-command the script can be sourced with \\${MB}eval ''\\`!!''\\`\\${NE}.
          ${hi}\\${MB}eval ''\\`bud prepvm clear''\\`\\${NE} will remove all set \\${WB}QEMU*-ENVS\\${NE}.'';
        ### '' fix syntax-highlighting
        script      = ./prepvm.bash;
        synopsis    = "prepvm HOST";
        # synopsis = "\\${YB}prepvm HOST\\${NE}";
        writer      = budUtils.writeBashWithPaths [ coreutils            nixUnstable shellColorDefinitions      ];
      };

      sburn = {
        description = ''Call  ''\\`bud burn''\\` with sudo'';
        help        = ''sudo-wrapper for \\${MB}''\\`bud burn''\\`\\${NE}'';
        ### '' fix syntax-highlighting
        script      = ./sudoBurn.bash;
        synopsis    = "sburn iso";
        writer      = budUtils.writeBashWithPaths [ coreutils            nixUnstable                            ];
      };

      template = {
        description = ''
          Configurations like i3-mode should always be the same.
          ${di}To speed up such tasks templates can be use.
          ${di}Currently i3-mode and dotLocal templates are available.
          ${di}The specified template is instanciated and an import statement will be added to the clipboard.'';
        help        = "add the specified template to current location and if required an importStatement to the clipboard";
        script      = ./template.bash;
        synopsis    = "template TYPE";
        writer      = budUtils.writeBashWithPaths [ coreutils     gnused nixUnstable shellColorDefinitions xsel ];
      };

      testCreate = {
        description = ''
          Instantiate a test-template.
          ${di}currently templates for basic~, bud~, golden~ suite~ and variants~tests are available'';
        help        = "create a test";
        script      = ./testCreate.bash;
        synopsis    = "testCreate TYPE LOCATION";
        writer      = budUtils.writeBashWithPaths [ coreutils     gnused nixUnstable shellColorDefinitions      ];
      };

      testInteractive = {
        description = ''In order to debug a test or check a configuration change in a vm,
        a prebuild test can be run interactively.
        After starting the test, the machine has to be started with \\${MB}start_all()${NE} on the python-cli.'';
        help        = "run a prebuild test interactively;  [k,keep] keep-vm-state";
        script      = ./testInteractive.bash;
        synopsis    = "testInteractive [k|keep]";
        writer      = budUtils.writeBashWithPaths [ coreutils            nixUnstable                         ];
      };

      testPrebuild = {
        description = ''
          In order to debug a test or check a configuration change in a vm,
          ${di}a prebuild test can be run interactively. This command builds the vm for interactive usage.
          ${di}Start the test with  \\${MB}bud testInteractive${NE}'';
        help        = "prebuild a test for interactive usage (tests.nixos.profiles.TEST)";
        script      = ./testPrebuild.bash;
        synopsis    = "testPrebuild TESTNAME";
        writer      = budUtils.writeBashWithPaths [ coreutils git        nixUnstable                            ];
      };

      testRun = {
        description = ''
          Run a single test.
          ${di}Testnames have to be attribute-chains starting at the directory tests.
          ${di}E.g.: tests.bud.testRun'';
        help        = "run a test (tests.nixos.profiles.TEST)";
        script      = ./testRun.bash;
        synopsis    = "testRun TESTNAME";
        writer      = budUtils.writeBashWithPaths [ coreutils git        nixUnstable                            ];
      };

      testRunAll = {
        description = ''Run all tests. Tests are defined in the tests-subdir of DEVOS.'';
        help        = "run all tests";
        script      = ./tests.bash;
        synopsis    = "testRunAll";
        writer      = budUtils.writeBashWithPaths [ coreutils git        nixUnstable                            ];
      };
    };
}
