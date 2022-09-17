{ inputs
, lib
, pkgs
, self
, ports
, variant
, ...
}:
let
  inherit (lib)
  mapAttrs'
  nameValuePair
  ;

  domainTestServer = inputs.domainTestServer.defaultPackage.${pkgs.system};
  serviceName      = "domainTestServer-${variant}";
  services = {
  # name      value
    http  = { port = ports.http;};
    https = { port = ports.https;};
  };
in
{
  ### trust the testCA - files need to be available at evaluation-time
  security.pki.certificateFiles = [
          ../../../../../../../../pkgs/sourcesLocal/domainTestServer/cert/domain.test/ca.crt ### profileTests
          ../../../../../../../../pkgs/sourcesLocal/domainTestServer/cert/thesym.site/ca.crt ### hostTests
        ];

  sops.secrets = {
    "pkgs/sourcesLocal/domainTestServer/server/key"  = {path = "/etc/pki/tls/private/domainTestServer.key";};
    "pkgs/sourcesLocal/domainTestServer/server/cert" = {path = "/etc/pki/tls/certs/domainTestServer.crt"  ;};
  };

  ### Create services: e.g.
  ### domainTestServer-dev-http
  ### domainTestServer-dev-https
  systemd.services = mapAttrs'
  (name: value: nameValuePair "${serviceName}-${name}" {
    description   = "domainTestServer-${toString value.port}: serve test-response on port";
    enable        = true;
    serviceConfig = {
      Type       = "simple";
      ExecStart  = "${domainTestServer}/bin/domainTestServer ${toString value.port}";

      ExecReload = "${pkgs.procps}/bin/pkill -HUP     $MAINPID";
      ExecStop   = "${pkgs.procps}/bin/pkill -SIGTERM $MAINPID";

      # Restart    = "on-failure";
      Restart    = "always";
      RestartSec = 1;
    };
    wantedBy      = [ "default.target" ];
  }
  )
  services;
}
