{ inputs
, lib
, profiles
, ... }:
let
  # colorScheme = "custom-base16-monokai";
  colorScheme = "custom-test";
  # colorScheme = "dracula";
  # colorScheme = "horizon-dark";
  # colorScheme = "nord";
  # colorScheme = "tokyonight";

  mainUser    = "nixos";

in
{
  imports = [
    (import ./home.nix   {inherit inputs lib mainUser profiles colorScheme;})
    (import ./system.nix {inherit            mainUser profiles            ;})
  ];
}

### TODO extract to documentation

### build with: `bud build isoBase bootstrapIso`
### reachable on the local link via ssh root@fe80::47%eno1
### where 'eno1' is replaced by your own machine's network
### interface that has the local link to the target machine

### color: themes must belong to nix-color or must be selfdefined (in user/profiles/themes name has to start with "custom-")
