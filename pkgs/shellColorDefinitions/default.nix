{lib
, stdenv
, version ? "0.0.0"
}:

stdenv.mkDerivation rec {
  pname = "shellColorDefinitions";
  inherit version;


  src =  ../sourcesLocal/shellColorDefinitions;


  installPhase = ''
    mkdir -p $out/bin
    cp shellColorDefinitions $out/bin/
  '';


  meta = with lib; {
    description = "ansi color variables for the shell";
    license = licenses.mit;
    maintainers = with maintainers; [ fb ];
  };
}
