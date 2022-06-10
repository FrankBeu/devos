{ lib
, pkgs
, rustPlatform
, sources
, SDL2
, SDL2_image
, SDL2_ttf
}:

rustPlatform.buildRustPackage rec {
  pname   = "riv";
  version = "0.4.0";

  ### KEEP PACKAGE IS UNMAINTAINED - WILL NOT CHANGE
  src = pkgs.fetchFromGitHub {
    owner  = "Davejkane";
    repo   = "riv";
    rev    = "ce39eec40071a071a08b81b4066a2da27978b350";
    sha256 = "sha256-j/5J5RBHYuMzHodhKYCJZp5jF9i/iK0ABq6VKi+/8pQ=";
  };

  cargoSha256 = "sha256-gtQJBjWPqZAVmpNQVW7AgfvxTTOZ2+QV+2QOvh6UvQI=";

  patches = [
    ./0001-change-keybindings-HJKL-jklsemicolon--jk-KL.patch
  ];

  buildInputs = [
    SDL2
    SDL2_image
    SDL2_ttf
  ];

  meta = with lib; {
    description = "Riv - The Rust Image Viewer";
    homepage = "https://github.com/Davejkane/riv";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fb ]
    ;
  };
}
