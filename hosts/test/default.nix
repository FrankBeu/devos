{ inputs
, lib
, profiles
, ...
}:
{
  imports = [
    ./variables
    ./home.nix
    ./system.nix
  ];
}
