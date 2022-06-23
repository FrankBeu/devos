{config, nixosConfig, pkgs, lib, zshDotDir, ...}:
let
  inherit (config.home) homeDirectory;

  pluginsDir = "${zshDotDir}/plugins";
  plugins = [
    rec {
      name = "cd-gitroot";
      file = "${name}.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "mollifier";
        repo = "cd-gitroot";
        rev = "66f6ba7549b9973eb57bfbc188e29d2f73bf31bb";
        sha256 = "sha256:00aj9z3fa6ghjpz7s9cdqpfy4vh1v19z284p4f7xj0z40vrlbdx4";
      };
    }
    rec {
      name = "fzf-tab";
      file = "${name}.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "Aloxaf";
        repo = "fzf-tab";
        rev = "b5e836f1d271507db40e23deadde75d8c9fef078";
        sha256 = "sha256:0rg8wyk39f4v09q4imw3dh6m9i9aijk52175dmjjmqcbszy29wq9";
      };
    }

    ### AS NIX-PKGS
    ### cod
    ### fast-syntax-highlighting
    ### zsh-autosuggestions
    ### zsh-bd
    ### zsh-nix-shell

    ### TEMPLATES
    # rec {
    #   name = "";
    #   file = "${name}.plugin.zsh";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "";
    #     repo = "";
    #     rev = "";
    #     sha256 = lib.fakeSha256;
    #     # sha256 = "";
    #   };
    # }
    #
    # {
    #   name = "";
    #   file = "";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "";
    #     repo = "";
    #     rev = "";
    #     # sha256 = "";
    #     sha256 = lib.fakeSha256;
    #   };
    # }
  ];
in {

  imports = [
    ./doc.nix
    ./zsh-defer.nix
  ];

  ### initialize plugins
  ### TODO source plugins from hm
  programs.zsh = {
    initExtra = ''
      ${pkgs.lib.concatStrings (map (plugin: ''
         path+="$HOME/${pluginsDir}/${plugin.name}"
        fpath+="$HOME/${pluginsDir}/${plugin.name}"
      '') plugins)}

      ${pkgs.lib.concatStrings (map (plugin: ''
        zsh-defer source "$HOME/${pluginsDir}/${plugin.name}/${plugin.file}"
      '') plugins)}


      ### NIX-PKGS
      zsh-defer source /run/current-system/sw/share/zsh-bd/bd.plugin.zsh
      zsh-defer +1 +2 source <(cod init $$ zsh)
      zsh-defer source /run/current-system/sw/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh
      zsh-defer source /run/current-system/sw/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      zsh-defer source /run/current-system/sw/share/zsh-nix-shell/nix-shell.plugin.zsh
    '';
  };

  ### install plugins
  home.file =
    builtins.foldl' (a: b: a // b) {}
    # (map (plugin: { "/home/${username}/${pluginsDir}/${plugin.name}".source = plugin.src; })
    (map (plugin: { "${homeDirectory}/${pluginsDir}/${plugin.name}".source = plugin.src; })
    plugins);


    ###
    ##
    # ** TODO??: write overlay for homemanager-module zsh
    #
    #    ~/SRC/GITHUB/NIX/home-manager/modules/programs/zsh.nix
    #    option zsh-deferEnable
    #    zsh-defer at begining
    #    plugins == regular plugin
    #    if zsh-deferEnable - source with defer
}
