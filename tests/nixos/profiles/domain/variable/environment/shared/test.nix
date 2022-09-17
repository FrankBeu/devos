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
  ports
  ;

  subDomain = if subDomainName == "" then domainName else "${subDomainName}.${domainName}";

  test = {
    nodes = {
      machine = { inputs, lib, pkgs, profiles, suites, variables, ... }:
      {
        imports = with profiles;
        [
          autologin.variable
          domain.server
          networking.nameserver.regular
          tools.network                  ### DEV

          domain.variable.environment.${variant}

          ### generate the proxied testServices giving the actual response to the test
          ( import  ../shared/testService {inherit inputs lib pkgs ports self variant ;})
        ] ++
        suites.debug ++
        [];

        ### WORKING
        # security.pki.certificateFiles = [
        #   ../../../../../../../pkgs/sourcesLocal/domainTestServer/cert/ca/ca.crt
        # ];

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

  testScriptExternal = (import ../shared/testScript.py.nix {inherit ports subDomain variant;});

in
{
  inherit host test;
}
