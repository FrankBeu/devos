{ lib, config, ... }:
{
  environment.etc."currentSystemPackages".text =
    let
      packages     = builtins.map (p: "${p.name}") config.environment.systemPackages;
      sortedUnique = builtins.sort builtins.lessThan (lib.unique packages);
      formatted    = builtins.concatStringsSep "\n" sortedUnique;
    in
    formatted;
}
