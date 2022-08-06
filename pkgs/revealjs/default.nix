{ fetchFromGitHub
, lib
, sources
, stdenv
}:
let
  inherit (sources.revealjs)
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

  # pname = "revealjs";
  # version =  "4.1.2";

  # src = fetchFromGitHub {
  #   owner = "hakimel";
  #   repo = pname;
  #   rev = "${version}";
  #   sha256 = "sha256:0z42q4wv6ji1vrkbdx52g2jj5qnxv155il2wly70q0vjphdk0kgh";
  #   # sha256 = lib.fakeSha256;
  # };

  patches = [
    ./patches/dist.patch
  ];

  installPhase = ''
    mkdir -p $out/share/revealjs
    cp -r . $out/share/revealjs
  '';

  meta = with lib; {
    homepage = "https://revealjs.com/";
    description = "The HTML Presentation Framework";
    license = licenses.mit;
    maintainers = with maintainers; [ fb ];
  };
}
