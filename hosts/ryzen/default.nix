########################################################################
########################################################################
###                                                                  ###
### TODO: resolve the following issues or find a way to automate     ###
###                                                                  ###
### {DEVEL,PROD}-DEVIATION:                                          ###
###                                                                  ###
### PROD:                                                            ###
###                                                                  ###
### CHECK if profiles.bud is set in ./system.nix                     ###
### TODO: not working on tests "error: attribute 'system' missing    ###
###       cf. https://github.com/divnix/bud/blob/main/module.nix#L73 ###
###                                                                  ###
### CHECK if nix.extraOptions in /nixos/profiles/core/default.nix    ###
###       contains `fallback = true`                                 ###
### TODO: resolve                                                    ###
###                                                                  ###
### CHECK if interface.INTERFACE.useDHCP ./networking/default.nix    ###
###       is set to true                                             ###
### TODO: automate                                                   ###
###                                                                  ###
########################################################################
########################################################################

{ suites, profiles, ... }:
{

  imports = [
    ./variables
    # ./home.nix
    ./system.nix
  ];

}

### TODO extract to documentation
### color: themes must belong to nix-color or must be selfdefined (in user/profiles/themes; name has to start with "custom-")
