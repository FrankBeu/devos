{ port }:
''
[http]

  [http.routers]
    [http.routers.docDotLocal]
      ### TODO extract domainName to module or variables
      rule    = "Host(`doc.local`)"
      service = "docDotLocal"

  [http.services]
    [http.services.docDotLocal]
      [http.services.docDotLocal.loadBalancer]
        # passHostHeader = true
        [[http.services.docDotLocal.loadBalancer.servers]]
          ### TODO extract port to module or variables
          url = "http://127.0.0.1:${toString port}"
''
# Local Variables:
# mode: conf-toml
# End:
