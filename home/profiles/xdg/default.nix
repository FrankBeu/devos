{ pkgs, ... }:
{
  ### XDGs will be set automatically in zshrc via "/home/<USER>/.nix-profile/etc/profile.d/hm-session-vars.sh"
  ### XDGs are defined in zshenv, too - so availability within zsh-definition-files and home-manager is ensured.
  ### cf. ../shell/zsh/zsh/zshenv.nix:15
  ### cf. https://gitlab.com/rycee/home-manager/-/blob/master/modules/misc/xdg.nix
  ### sets
  ### XDG_CACHE_HOME
  ### XDG_CONFIG_HOME
  ### XDG_DATA_HOME
  xdg.enable = true;

  ### custom *.desktop files have to be registered to ~/.local/share/mimeapps.list:
  ### cf. ./browser/firefox/firefox.nix
  ### TODO use defaultBrowser for images
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "zathura.desktop";
      "image/jpeg"      = "firefox.desktop";
      "text/csv"        = "emacsclient.desktop";
    };
  };

  ### TODO use absolute path so they are reusable with systemd-tmpfiles cf.: https://nix-community.github.io/home-manager/release-notes.html#sec-release-20.09-state-version-changes
  # check where the following is set
  # home.file."DEBUG".text   =  ''
  #   ${config.home.homeDirectory}
  #   ${config.home.username}
  # '';

  xdg.userDirs = {
    enable            = true;
    createDirectories = true;

    extraConfig = {
      XDG_MISC_DIR   = "\$HOME/MISC";
      XDG_STATE_HOME = "\$HOME/.local/state";
    };

    desktop     = "\$HOME/.DESKTOP";
    documents   = "\$HOME/DOCUMENTS";
    download    = "\$HOME/DOWNLOADS";
    music       = "\$HOME/MUSIC";
    pictures    = "\$HOME/PICTURES";
    publicShare = "\$HOME/.PUBLIC";
    templates   = "\$HOME/.TEMPLATES";
    videos      = "\$HOME/VIDEOS";
  };
}

### TODO doc
### https://wiki.archlinux.org/title/XDG_Base_Directory
### https://wiki.archlinux.org/title/XDG_user_directories
### https://wiki.archlinux.org/title/XDG_MIME_Applications
### opening:
### view ../filemanager/TODO.org
