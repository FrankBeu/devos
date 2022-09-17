{ config
, lib
, ...
}:
{
  services.traefik = {
    enable           = true;
    staticConfigFile = ./traefik.toml;### setting dynamic-config-dir to /etc/traefik/conf
  };

  ### TODO add to module
  system.activationScripts.makeTraefikLogDir =
    let logDir = "/var/log/traefik"; in
    lib.stringAfter [ "var" ] ''
      mkdir -p              ${logDir}
      chown traefik:traefik ${logDir}
    '';
}
