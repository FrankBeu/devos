{ suites, profiles, ... }:
{
  imports = [
    ./variables
    ./home.nix
    ./system.nix
  ];
}
