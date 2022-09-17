{ inputs
, pkgs
, self
, variant
, ...
}:
let
  domainTestServer = inputs.domainTestServer.defaultPackage.${pkgs.system};
  port             = (toString 8888);
  serviceName      = "test${port}";
in
{
  systemd.services.${serviceName} = {
    description   = "${serviceName}: respond on ${port}";
    enable        = true;
    serviceConfig = {
      Type       = "simple";
      ExecStart  = "${domainTestServer}/bin/domainTestServer ${port}";

      ExecReload = "${pkgs.procps}/bin/pkill -HUP     $MAINPID";
      ExecStop   = "${pkgs.procps}/bin/pkill -SIGTERM $MAINPID";

      # Restart    = "on-failure";
      Restart    = "always";
      RestartSec = 1;
    };
    wantedBy      = [ "default.target" ];
  };

}
