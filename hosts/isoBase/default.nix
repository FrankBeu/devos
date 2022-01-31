{ inputs
, profiles
, ... }:
let
  mainUser = "nixos";
in
{
  imports = [
    (import ./home.nix   {inherit inputs mainUser profiles;})
    (import ./system.nix {inherit        mainUser profiles;})
  ];
}

### TODO extract to documentation
### build with: `bud build isoBase bootstrapIso`
### reachable on the local link via ssh root@fe80::47%eno1
### where 'eno1' is replaced by your own machine's network
### interface that has the local link to the target machine
