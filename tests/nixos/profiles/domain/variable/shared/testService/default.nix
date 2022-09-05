{ inputs
, pkgs
, self
, port
, variant
, ...
}:
let
  domainTestServer = inputs.domainTestServer.defaultPackage.${pkgs.system};
  serviceName      = "domainTestServer-${variant}";
in
{
  systemd.services.${serviceName} = {
    description   = "domainTestServer-${variant}: serve test response on port";
    enable        = true;
    serviceConfig = {
      Type       = "simple";
      ExecStart  = "${domainTestServer}/bin/domainTestServer ${toString port}";

      ExecReload = "${pkgs.procps}/bin/pkill -HUP     $MAINPID";
      ExecStop   = "${pkgs.procps}/bin/pkill -SIGTERM $MAINPID";

      # Restart    = "on-failure";
      Restart    = "always";
      RestartSec = 1;
    };
    wantedBy      = [ "default.target" ];
  };

}
