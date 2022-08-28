{ fetchurl
, lib
, sources
, stdenv
}:
let
  inherit (sources.kubectl-neat)
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
    cp kubectl-neat $out/bin/
  '';

  meta = with lib; {
    description = "Clean up Kubernetes yaml and json output to make it readable";
    homepage    = "https://github.com/itaysk/kubectl-neat";
    license     = licenses.asl20;
    maintainers = with maintainers; [ fb ];
  };
}
