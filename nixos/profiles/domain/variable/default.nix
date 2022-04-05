{ variables, ... }:
let domain = variables.domain;
in
{
  services.coredns = {
    enable = true;
    config = ''
      dev.${domain} {
        template IN A  {
            answer "{{ .Name }} 0 IN A 127.0.0.1"
        }
      }

      stage.${domain} {
        template IN A  {
            answer "{{ .Name }} 0 IN A 127.0.0.1"
        }
      }

    '';
    ### let globalDns handle this entry (via NUC)
    # ${domain} {
      #   template IN A  {
        #       answer "{{ .Name }} 0 IN A 192.168.0.17"
        #   }
        # }
        # answer "{{ .Name }} 0 IN A 127.0.0.1"
  };
}
