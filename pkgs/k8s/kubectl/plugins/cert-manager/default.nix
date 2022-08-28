{ fetchurl
, lib
, sources
, stdenv
}:
let
  inherit (sources.cert-manager)
  pname
  version
  src
  ;
in
stdenv.mkDerivation rec {
  inherit
  pname
  version
  src
  ;

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/bin
    cp kubectl-cert_manager $out/bin/
  '';

  meta = with lib; {
    description = "kubectl-plugin for cert-manager";
    homepage    = "https://cert-manager.io/docs/usage/kubectl-plugin/";
    license     = licenses.asl20;
    maintainers = with maintainers; [ fb ];
  };
}
