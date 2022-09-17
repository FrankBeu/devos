{ domain, ports }:
with ports;
''
[http]

  [http.routers]
    [http.routers.prodHttp]
      entryPoints   = ["web"]
      # middlewares = ["auth"]
      service       = "prodHttp"
      rule          = "HostRegexp(`${domain}`,`{subdomain:[a-z.]+}${domain}`)"

  [http.services]
    [http.services.prodHttp]
      [http.services.prodHttp.loadBalancer]
        # passHostHeader = true
        [[http.services.prodHttp.loadBalancer.servers]]
          url = "http://127.0.0.1:${toString web}"


[tcp]

  [tcp.routers]
    [tcp.routers.prodTcp]
      entryPoints   = ["websecure"]
      # middlewares = ["auth"]
      service       = "prodTcp"
      rule          = "HostSNIRegexp(`${domain}`,`{subdomain:[a-z.]+}${domain}`)"
      [tcp.routers.prodTcp.tls]
        passthrough = true

  [tcp.services]
    [tcp.services.prodTcp]
      [tcp.services.prodTcp.loadBalancer]
        # passHostHeader = true
        [[tcp.services.prodTcp.loadBalancer.servers]]
          address = "127.0.0.1:${toString websecure}"
''
# Local Variables:
# mode: conf-toml
# End:
