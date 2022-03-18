{ variables }:
{
  tmpfiles =
    let
      variablesTestActual = ''${variables.test}\n${variables.currentColorSchemeName}\n'';
    in
    [
      "f /tmp/variablesTestActual - - - - ${variablesTestActual}"
      "L /tmp/variablesTestTarget - - - - ${./variablesTestTarget}"
    ];
}
