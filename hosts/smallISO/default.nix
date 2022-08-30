{ profiles
, suites
, ...
}:
{
  imports = [
    ./variables
    ./home.nix
    ./system.nix
  ];
}
