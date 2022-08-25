{ buildGoModule
, fetchFromGitHub
, lib
, sources
}:
buildGoModule rec {
  inherit (sources.kube2pulumi)
  pname
  version
  src
  vendorSha256
  ;

  doCheck = false;

  meta = with lib; {
    homepage = "https://www.pulumi.com/kube2pulumi/";
    description = "Upgrade your Kubernetes YAML to a modern language";
    license = licenses.asl20;
    maintainers = with maintainers; [ fb ];
  };
}
