{ pkgs
, fetchFromGitHub
, ...
}:
{
  fonts = {
    fontconfig.enable = pkgs.lib.mkForce true;
  };

  home = {
    packages = with pkgs; [
      # i3statusBar              ### TODO no overlays available in homemanager currently imported in /etc/nixos/config/services/xserver/default.nix
      # font-awesome             ### https://github.com/FortAwesome/Font-Awesome
      material-icons             ### https://github.com/google/material-design-icons
      material-design-icons      ### https://github.com/Templarian/MaterialDesign-Webfont
    ];

    file = {
      ".local/share/fontRepos/Font-Awesome" = {
        source = pkgs.fetchFromGitHub {
          owner = "FortAwesome";
          repo = "Font-Awesome";
          rev =  "5.15.3";
          sha256 = "sha256:1sqj64vmnpysy0mc4w7b393030dzlk2vn2i1a0bzi8zlbsrccm88";
        };
      };
      ".local/share/fontRepos/material-design-icons" = {
        source = pkgs.fetchFromGitHub {
          owner = "google";
          repo = "material-design-icons";
          rev =  "71b57d225de077a962ef43f2a42267fd5b8da2ba";
          sha256 = "sha256:0j7vs4kdibhvqnj2cqbb09y54rh7hzfyk1c7mhmg6jzwz67dhjcb";
        };
      };
      ".local/share/fontRepos/MaterialDesign-Webfont" = {
        source = pkgs.fetchFromGitHub {
          owner = "Templarian";
          repo = "MaterialDesign-Webfont";
          rev =  "v5.9.55";
          sha256 = "sha256:0mg6g262qjhjrkc9xjlv3s8a7qfh1wglfbg513d414xh3zlms4cl";
        };
      };
    };
  };
}
