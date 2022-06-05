{ lib
, buildGoModule
, fetchgit
}:

buildGoModule rec {
  pname = "powerline-go";
  version = "1.22.0";


  # src = fetchgit {
  #   url = "https://gitea.thesym.site/frank/powerline-go";
  #   rev = "${version}";
  #   sha256 = "sha256:0g8vnk1ygkgk1b4s56j6jc7x490i25mk11k2c9dh3dj29m1hkx2h";
  # };
  src =  /home/frank/SRC/GITEA/FRANK/FORKS/powerline-go;

  vendorSha256 = "sha256:1y51lfp4f13jx9qi853xp2b9vmks5d5a9bm920snwgzymil7m08x";

  doCheck = false;

  meta = with lib; {
    changelog   = "https://gitea.thesym.site/frank/powerline-go/releases/tag/${version}";
    description = "A Powerline like prompt for Bash, ZSH and Fish";
    homepage    = "https://gitea.thesym.site/frank/powerline-go.git";
    license     = licenses.gpl3Plus;
    maintainers = with maintainers; [ fb ];
    platforms   = platforms.unix;
  };
}
