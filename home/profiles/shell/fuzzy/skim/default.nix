{config, pkgs,  ...}:
{
  programs = {
    pet.selectcmdPackage = pkgs.skim;
    skim = {
      enable                 = true;
      enableZshIntegration   = true;

      defaultCommand         = "fd --type f";
      defaultOptions         = [ "--height 40%" "--prompt ⟫" ];

      changeDirWidgetCommand = "fd --type d";
      changeDirWidgetOptions = [ "--preview 'tree -C {} | head -200'" ];

      fileWidgetCommand      = "fd --type f";
      fileWidgetOptions      = [ "--preview 'head {}'" ];

      historyWidgetOptions   = [ "--tac" "--exact" ];
    };
  };
}
