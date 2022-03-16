{ config, lib, ... }:
{
  options.colorscheme = lib.mkOption {
    default     = { };
    description = "A colorscheme which can be used throughout the system";
    type        = lib.types.attrs;
    ### TODO check the usage of XOR
    # type        = lib.types.attrsOf;
    # type        = lib.types.anything;
    ### https://nixos.org/manual/nixos/stable/index.html#sec-option-types-basic
  };

  config._module.args.colorscheme = config.colorscheme;
}
