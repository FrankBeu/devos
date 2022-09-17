{ ... }:
''
[http]

  [http.routers]
    [http.routers.dashboardLocal]
      rule    = "Host(`traefik.local`, `dash.local`)"
      service = "api@internal"
''
# Local Variables:
# mode: conf-toml
# End:
