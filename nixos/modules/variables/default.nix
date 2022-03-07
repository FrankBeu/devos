###
##
# * Variables
#   c.f. https://discourse.nixos.org/t/variables-for-a-system/2342/7
#
{ config, lib, ... }:
{
  options.variables = lib.mkOption {
    type = lib.types.attrs;
    default = { };
  };
  config._module.args.variables = config.variables;
}
