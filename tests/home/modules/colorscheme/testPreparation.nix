{ colorscheme }:
{
  tmpfiles =
    let
      colors          = colorscheme.colors;
      colorTestActual = ''${colors.base00}\n${colors.base01}\n'';
    in
    ''
      f /home/nixos/tmp/colorTestActual - - - - ${colorTestActual}
      L /home/nixos/tmp/colorTestTarget - - - - ${./colorTestTarget}
    '';
}
