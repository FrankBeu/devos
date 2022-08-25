{ buildGoModule
# { buildGo118Module
, fetchFromGitHub
, lib
, sources
}:
let
  inherit (sources.crd2pulumi)
  pname
  version
  src
  vendorSha256
  ;
in
# buildGo118Module rec {
  buildGoModule rec {
    inherit
    pname
    version
    src
    vendorSha256
    ;

    doCheck = false;
    # doCheck = true;

    ldflags = "-X github.com/pulumi/crd2pulumi/gen.Version=${version}";

    meta = with lib; {
      homepage = "https://www.pulumi.com/blog/introducing-crd2pulumi/";
      description = "Generate typed CustomResources from a Kubernetes CustomResourceDefinition";
      license = licenses.asl20;
      maintainers = with maintainers; [ fb ];
    };
  }
