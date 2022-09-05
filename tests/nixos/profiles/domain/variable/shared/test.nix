{ mkTest
, self
, testHelpers
, variantSpecifics
, ...
}:
let
  host          = self.nixosConfigurations.test;
  username      = host.config.variables.testing.user.name;
  domainName    = "domain.test";

  inherit (variantSpecifics)
  subDomainName
  variant
  port
  ;

  subDomain = if subDomainName == "" then domainName else "${subDomainName}.${domainName}";

  test = {
    nodes = {
      machine = { inputs, suites, profiles, variables, pkgs, ... }:
      {
        imports = with profiles;
        [
          autologin.variable
          domain.server
          networking.nameserver.regular
          tools.network                  ### DEV

          domain.variable.${variant}

          ### generate the caddy-proxied testService by giving the actual response to the test
          ( import  ../shared/testService {inherit inputs pkgs port self variant ;})
        ] ++
        # suites.debug ++
        [];

        variables.domain = domainName;
      };
    };

    enableOCR  = false;

    testScript =
      ''
        ${testHelpers}
        start_all()
        ${testScriptExternal}
      '';

      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

  testScriptExternal = (import ../shared/testScript.py.nix {inherit port subDomain variant;});

in
{
  inherit host test;
}
