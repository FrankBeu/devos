{ suites, profiles, ... }:
{

  imports = [
    # ./variables
    # ./home.nix

    ./system.nix
  ];

}

### TODO extract to documentation
### color: themes must belong to nix-color or must be selfdefined (in user/profiles/themes; name has to start with "custom-")
