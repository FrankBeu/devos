{ variables }:
{
  content =
    ''
      import:
        - "~/.config/alacritty/themes/${variables.currentThemeName}.yaml"
    '';
}
