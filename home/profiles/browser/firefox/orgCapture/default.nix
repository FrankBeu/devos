{ config
, pkgs
, ...
}:
{
  programs.firefox.extensions = with pkgs.nur.repos.rycee.firefox-addons; [ org-capture ];

  home.file.".local/share/applications/org-protocol.desktop".source = ./org-protocol.desktop;
  xdg.mimeApps = {
    enable              = true;
    defaultApplications = {
      "x-scheme-handler/org-protocol" = "org-protocol.desktop";
    };
  };

  home.file.".manualActions/manualActions.org".text = pkgs.lib.mkDefault( pkgs.lib.mkOrder 60 ''
    ** firefox
    *** TODO org-protocol: adjust Template Keys:
    [[file:~/.emacs.d/orgmode/capture.org::*PROTOCOL][PROTOCOL]]
    =about:addons::Org Capture::Preferences=''
  );
}
