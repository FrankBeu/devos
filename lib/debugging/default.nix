{ self, lib }:
let
  formatContainer = type: string:
  let char =
    if builtins.isList type
    then { o = "["; c = "]";}   ### Opening, Closing
    else { o = "{"; c = "}";};
  in
  ''${char.o}''\n''\t${string}${char.c}'';  ### BACKKSPACE: because the last item has an unnecessary tab appended

  printList = list: formatContainer [] (builtins.foldl' (x: y: x + y + "\n\t") "" (list));
  printSet  = set:  formatContainer {} (builtins.foldl' (x: y: x + y + "\n\t") "" (builtins.attrNames set));

  ### TODO if container is string print string
  printContainer = container: if builtins.isList container
  then printList container
  else printSet container;
in
{
  inherit
  printContainer
  ;
}
