{ domain, ports }:
with ports;
''
[http]

  [http.routers]
    [http.routers.stageHttp]
      entryPoints   = ["web"]
      service       = "stageHttp"
      rule          = "HostRegexp(`stage.${domain}`,`{subdomain:[a-z.]+}stage.${domain}`)"

  [http.services]
    [http.services.stageHttp]
      [http.services.stageHttp.loadBalancer]
        # passHostHeader = true
        [[http.services.stageHttp.loadBalancer.servers]]
          url = "http://127.0.0.1:${toString web}"


[tcp]

  [tcp.routers]
    [tcp.routers.stageTcp]
      entryPoints   = ["websecure"]
      service       = "stageTcp"
      rule          = "HostSNIRegexp(`stage.${domain}`,`{subdomain:[a-z.]+}stage.${domain}`)"
      [tcp.routers.stageTcp.tls]
        passthrough = true

  [tcp.services]
    [tcp.services.stageTcp]
      [tcp.services.stageTcp.loadBalancer]
        # passHostHeader = true
        [[tcp.services.stageTcp.loadBalancer.servers]]
          address = "127.0.0.1:${toString websecure}"
''
# Local Variables:
# mode: conf-toml
# End:
