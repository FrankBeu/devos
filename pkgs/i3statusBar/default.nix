{ lib
, buildGoModule
, fetchgit
, pkg-config
, alsaLib
, self
}:

buildGoModule rec {
  pname = "i3statusBar";
  # version = "0.1.0";
  version = "0.2.0";

  # src = fetchgit {
  #   url = "https://gitea.thesym.site/frank/i3statusBar.git";
  #   rev = "${version}";
  #   # sha256 = "sha256:0525a0gf2n0h5gs5kigj6iqv10lx5s8y81hjciy9kssy540g5rdx";
  #   sha256 = "sha256:0fmh1k5rvxvzdfrdhmny7i1in6cra56c2sas3iykz6b3nhf7n0fj";
  # };

  src =  ../sourcesLocal/i3statusBar;

  ### vendorFolder exists:
  # vendorSha256 = null;

  vendorSha256 = "sha256:140kwg09zla67pfzi21pnz0d2vc52b510hdf6a1qaka291vwls59";

  doCheck = false;

  subPackages = [ "." "./extraBars/i3statusBarTime"];

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    alsaLib
  ];

  meta = with lib; {
    homepage = "https://barista.run/";
    description = "An i3status alternative in golang";
    license = licenses.asl20;
    maintainers = with maintainers; [ fb ];
  };
}
