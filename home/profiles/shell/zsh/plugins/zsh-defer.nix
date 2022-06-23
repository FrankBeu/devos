{config, pkgs, lib, zshDotDir, ...}:

let
  ### TODO: map to programs.zsh.pluginsDir
  # pluginsDir = ".config/zsh/plugins";
  pluginsDir = "${zshDotDir}/plugins";
  defer =
    {
      name = "zsh-defer";
      src = pkgs.fetchFromGitHub {
        owner = "romkatv";
        repo = "zsh-defer";
        rev = "9d47fc2c51ec59e19ad41aa36f018ca8b851cf66";
        sha256 = "sha256:1xpf4ixvv12y1xwn1ckh7p6gvrpg5y2id3bzbj9hp3v8c5ixbjyc";
      };
    };
in {
  home.file.".config/zsh/plugins/${defer.name}".source = defer.src;

  programs.zsh = {
    ### TODO: use initExtraFirst -> needs homeManagerUpdate -> needs channel-switch (root) -> needs emacs27 -> needs emacsTDD
    # initExtraFirst = ''
    initExtraBeforeCompInit = ''
      #################################################################################################### zsh-defer
      ###
      ##
      #
      path+="$HOME/${pluginsDir}/zsh-defer"
      fpath+="$HOME/${pluginsDir}/zsh-defer"

      source "$HOME/${pluginsDir}/zsh-defer/zsh-defer.plugin.zsh"
      ###################################################################################### END zsh-defer
    '';
  };
}
