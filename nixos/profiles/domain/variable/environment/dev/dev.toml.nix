{ domain, ports }:
with ports;
''
[http]

  [http.routers]
    [http.routers.devHttp]
      entryPoints   = ["web"]
      service       = "devHttp"
      rule          = "HostRegexp(`dev.${domain}`,`{subdomain:[a-z.]+}dev.${domain}`)"

  [http.services]
    [http.services.devHttp]
      [http.services.devHttp.loadBalancer]
        # passHostHeader = true
        [[http.services.devHttp.loadBalancer.servers]]
          url = "http://127.0.0.1:${toString web}"


[tcp]

  [tcp.routers]
    [tcp.routers.devTcp]
      entryPoints   = ["websecure"]
      service       = "devTcp"
      rule          = "HostSNIRegexp(`dev.${domain}`,`{subdomain:[a-z.]+}dev.${domain}`)"
      [tcp.routers.devTcp.tls]
        passthrough = true

  [tcp.services]
    [tcp.services.devTcp]
      [tcp.services.devTcp.loadBalancer]
        # passHostHeader = true
        [[tcp.services.devTcp.loadBalancer.servers]]
          address = "127.0.0.1:${toString websecure}"
''
# Local Variables:
# mode: conf-toml
# End:
