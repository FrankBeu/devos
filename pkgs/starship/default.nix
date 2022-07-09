{
  fetchFromGitHub
  , installShellFiles
  , lib
  , libgit2
  , libiconv
  , nixosTests
  , pkg-config
  , pkgs
  , rustPlatform
  , stdenv

  , fenix
  , makeRustPlatform
  , sources
  , system
}:
let
  inherit (sources.starship)
  pname
  version
  src
  cargoLock
  rustToolchainChannel
  rustToolchainDate
  rustToolchainSha256
  ;
  toolchain = pkgs.fenix.toolchainOf {
    channel = rustToolchainChannel;
    date    = rustToolchainDate;
    sha256  = rustToolchainSha256;

  };
  rustPlatform = pkgs.makeRustPlatform {
    inherit (toolchain) cargo rustc;
  };
in
rustPlatform.buildRustPackage rec {

  inherit
  pname
  version
  src
  ;

  # pname = "starship";
  # version = "1.9.1";
  # src = fetchFromGitHub {
  #   owner = "starship";
  #   repo = pname;
  #   rev = "v${version}";
  #   sha256 = "sha256-IujaGyAGYlBb4efaRb13rsPSD2gWAg5UgG10iMp9iQE=";
  # };

  nativeBuildInputs = [ installShellFiles pkg-config ];

  buildInputs = [ libgit2 ];

  buildNoDefaultFeatures = true;
  # the "notify" feature is currently broken on darwin
  buildFeatures = if stdenv.isDarwin then [ "battery" ] else [ "default" ];

  postInstall = ''
    for shell in bash fish zsh; do
    STARSHIP_CACHE=$TMPDIR $out/bin/starship completions $shell > starship.$shell
    installShellCompletion starship.$shell
    done
  '';

  # cargoSha256 = "sha256-HrSMNNrldwb6LMMuxdQ84iY+/o5L2qwe+Vz3ekQt1YQ=";
  inherit cargoLock;

  preCheck = ''
    HOME=$TMPDIR
  '';

  passthru.tests = {
    inherit (nixosTests) starship;
  };

  meta = with lib; {
    description = "A minimal, blazing fast, and extremely customizable prompt for any shell";
    homepage = "https://starship.rs";
    license = licenses.isc;
    maintainers = with maintainers; [ bbigras danth davidtwco Br1ght0ne Frostman marsam ];
  };
}
