###
##
# * colorscheme
#
{ config, lib, ... }:
{
  options.colorscheme = lib.mkOption {
    type = lib.types.attrs;
    default = { };
  };
  config._module.args.colorscheme = config.colorscheme;
}
