{ self, config, pkgs, variables, ... }:
{
  systemd.services.test8080 = {
    description   = "test8080: test availability of 8080";
    enable        = true;
    serviceConfig = {
      Type       = "simple";
      ExecStart  = ./static;

      ExecReload = "${pkgs.procps}/bin/pkill -HUP     $MAINPID";
      ExecStop   = "${pkgs.procps}/bin/pkill -SIGTERM $MAINPID";

      # Restart    = "on-failure";
      Restart    = "always";
      RestartSec = 1;
    };
    wantedBy      = [ "default.target" ];
  };

}
