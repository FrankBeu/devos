{ variables }:
{
  ### keep username and theme dynamic
  content =
    ''
      import:
        - "~/.config/alacritty/themes/${variables.currentThemeName}.yaml"
      anchors:
            nixlogArgs: &nixLogArgs
              ["-e", "/home/${variables.mainUser.name}/.local/share/alacritty/hintHandler/nixLog"]
            emacsProgram: &emacsProgram
            "/home/${variables.mainUser.name}/.local/share/alacritty/hintHandler/emacsclient"
      ### nixVariableAnchorsEnd'';
}
