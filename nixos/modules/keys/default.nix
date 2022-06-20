### TODO not activated
{ config, lib, ... }:
{
  options.keys = lib.mkOption {
    default     = { };
    description = "Keys is used to store all used keybindings in one central location. Enables more stable tests and the usage of a keybindings-viewer. It also enables tracking of shadowing and duplication on build-time";
    type        = lib.types.attrs;
    ### TODO check the usage of XOR
    # type        = lib.types.attrsOf;
    # type        = lib.types.anything;
    ### https://nixos.org/manual/nixos/stable/index.html#sec-option-types-basic
    ### IDEAS
    ### required:
    ###           name
    ###           program
    ###           global
    ###           appLocal
    ###           modifier
    ###           info
    ###           appUsage
    ###
    ### keys.(global|appLocal.[APPNAME]).[....
    ### type: (layered, definer, leader, bindingMode), final XOR final.(bool)
    ### assertions:
    ###             no keybinding is use which is globaly defined
    ###             keybindins have to be unique per APPNAME
  };

  config._module.args.keys = config.keys;
}

### TODO tests, documentation
###      cf. how other modules are tested
### TODO how does event-catching work
### TODO what are global bindings
###      i3, input-manager, ???
### TODO what is _module.args used for
### has to be used in home and nixos
### https://nixos.wiki/wiki/Module
