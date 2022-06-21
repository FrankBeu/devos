{ environment, ... }:
let xrandrCommand = (builtins.replaceStrings ["\\\n" "  " "   "] ["" " " " "] environment.shellAliases."xd");
in
''#################################################################################################### RYZEN
exec_always --no-startup-id bash -c '${xrandrCommand}'  ### AOC SAMSUNG (desk)
''
### TODO doc
