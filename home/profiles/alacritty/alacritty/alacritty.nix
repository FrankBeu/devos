{ variables }:
{
      # import:
        # - "~/.config/alacritty/themes/symSite.yaml"
        # - "~/.config/alacritty/themes/${variables.currentThemeName}.yaml"
  ### keep username and theme dynamic
  ### TODO: use theme after graphical
  content =
    ''
      anchors:
          nixlogArgs: &nixLogArgs
            ["-e", "/home/${variables.mainUser.name}/.local/share/alacritty/hintHandler/nixLog"]
          emacsProgram: &emacsProgram
            "/home/${variables.mainUser.name}/.local/share/alacritty/hintHandler/emacsclient"
      ### nixVariableAnchorsEnd'';
}
