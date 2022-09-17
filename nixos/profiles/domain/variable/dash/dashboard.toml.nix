{ domain, hostName }:
''
[http]

  [http.routers]
    [http.routers.dashboardVariable]
      rule    = "Host(`traefik.${hostName}.${domain}`, `dash.${hostName}.${domain}`)"
      service = "api@internal"
''
# Local Variables:
# mode: conf-toml
# End:
