{
  services.coredns = {
    enable = true;
    config =
    ''
      local {
        template IN A  {
            answer "{{ .Name }} 0 IN A 127.0.0.1"
        }
      }
    '';
  };

  ### doc.local/system/domain/
  environment.etc."/docLocal/content/system/domain.org".source = ../domain.org;
}
