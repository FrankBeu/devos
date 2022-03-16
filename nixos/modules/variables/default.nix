###
##
# * Variables
#   c.f. https://discourse.nixos.org/t/variables-for-a-system/2342/7
#
{ config, lib, ... }:
{
  options.variables = lib.mkOption {
    default     = { };
    description = "A attributeSet which defines a set of globally usable variables";
    type        = lib.types.attrs;
    ### TODO check the usage of XOR
    # type        = lib.types.attrsOf;
    # type        = lib.types.anything;
    ### https://nixos.org/manual/nixos/stable/index.html#sec-option-types-basic
  };
  config._module.args.variables = config.variables;
}
