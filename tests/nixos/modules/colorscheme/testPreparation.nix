{ colorscheme }:
{
  tmpfiles =
    let
      colors          = colorscheme.colors;
      colorTestActual = ''${colors.base00}\n${colors.base01}\n'';
    in
    [
      "f /tmp/colorTestActual - - - - ${colorTestActual}"
      "L /tmp/colorTestTarget - - - - ${./colorTestTarget}"
    ];
}
