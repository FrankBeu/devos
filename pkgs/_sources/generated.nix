# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub }:
{
  manix = {
    pname = "manix";
    version = "d08e7ca185445b929f097f8bfb1243a8ef3e10e4";
    src = fetchFromGitHub ({
      owner = "mlvzk";
      repo = "manix";
      rev = "d08e7ca185445b929f097f8bfb1243a8ef3e10e4";
      fetchSubmodules = false;
      sha256 = "sha256-GqPuYscLhkR5E2HnSFV4R48hCWvtM3C++3zlJhiK/aw=";
    });
  };
  revealjs = {
    pname = "revealjs";
    version = "4.1.2";
    src = fetchFromGitHub ({
      owner = "hakimel";
      repo = "reveal.js";
      rev = "4.1.2";
      fetchSubmodules = false;
      sha256 = "sha256-8E0wG7xyAwyOp1zQWErY3eIipXii9LZm3iFKsznBgnw=";
    });
  };
  starship = {
    pname = "starship";
    version = "v1.9.1";
    src = fetchFromGitHub ({
      owner = "starship";
      repo = "starship";
      rev = "v1.9.1";
      fetchSubmodules = false;
      sha256 = "sha256-IujaGyAGYlBb4efaRb13rsPSD2gWAg5UgG10iMp9iQE=";
    });
    cargoLock = {
      lockFile = ./starship-v1.9.1/Cargo.lock;
      outputHashes = {

      };
    };rustToolchainSha256 = "sha256-HhkjtODLw16O7DNPew9+vqOtbM6hcAmLH55XnZ0G6Fk=";
    rustToolchainChannel = "nightly";
    rustToolchainDate = "2022-07-01";
  };
}
