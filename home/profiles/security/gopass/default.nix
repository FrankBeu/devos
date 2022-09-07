{ config
, nixosConfig
, pkgs
, variables
, ...
}:
let
  inherit (config.home) username;
in
{

  ### TODO WORKAROUND till age-ssh-agent-alike available
  xdg.configFile."i3/config".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
    ${(import ./i3/additional.nix)}
  '' );

  home = {
    packages = with pkgs; [
      gopass                   ### https://github.com/gopasspw/gopass
      gopass-jsonapi           ### https://github.com/gopasspw/gopass-jsonapi
      git-credential-gopass    ### https://github.com/gopasspw/git-credential-gopass
      xdotool                  ### TODO conditional import; why is this needed after all
      pinentry-gnome           ### needed for browser; needs nixos.profiles.gopassDependency
    ];

    ### TODO
    ### config
    file.".config/gopass/config.yml"               .text = (import ./gopass/config.nix { inherit username; });
    ### DOC
    file.".docLocal/content/homemanager/gopass.org".text = (import ./gopass.org        { useremail = variables.users.${username}.email; });
    ### TODO WORKAROUND till age-ssh-agent-alike available
    file.".local/bin/gopb".source = ./gopass/gopb;
    ### gopass-bridge
    ### TODO after age ssh-agent-alike
    # file.".config/gopass/gopass_wrapper.sh"        .source = ./gopass/gopass_wrapper.sh;
    ### gopass-jsonapi firefox
    ### check: gopass-jsonapi configure --print
    ### TODO after age ssh-agent-alike
    # file.".mozilla/native-messaging-hosts/com.justwatch.gopass.json".text = ''
      # {
      # "name":        "com.justwatch.gopass",
      # "description": "Gopass wrapper to search and return passwords",
      # "path":        "/home/${username}/.config/gopass/gopass_wrapper.sh",
      # "type":        "stdio",
      # "allowed_extensions": [
      # "{eec37db0-22ad-4bf1-9068-5ae08df8c7e9}"
      # ]
      # }
    # '';

    ### gopass-jsonapi chromium
    ### check: gopass-jsonapi configure --print
    ### TODO after age ssh-agent-alike
    # file.".config/chromium/NativeMessagingHosts/com.justwatch.gopass.json".text = ''
    #   {
    #   "name":        "com.justwatch.gopass",
    #   "description": "Gopass wrapper to search and return passwords",
    #   "path":        "/home/${username}/.config/gopass/gopass_wrapper.sh",
    #   "type":        "stdio",
    #   "allowed_origins": [
    #   "chrome-extension://kkhfnlkhiapbiehimabddjbimfaijdhk/"
    #   ]
    #   }
    # '';

    ### manualActions
    file.".manualActions/manualActions.org".text = pkgs.lib.mkDefault( pkgs.lib.mkOrder 70 ''
      ** gopass
      *** TODO setup
      ***** from SAFE
      - =~/.config/gopass/age-keyring.age=
      - =~/.local/share/gopass/stores='');
    sessionVariables = {
      GPG_TTY = "$(tty)";
    };

    shellAliases =
      let
        editor = if nixosConfig.services.emacs.enable
        then "'emacsclient -tc -a \"\"'"
        else "'vim'";
      in
      {
        gop      = ''gopass                        '';  ### GOPass
        gopau    = ''gopass audit                  '';  ### AUdit      Scan for weak passwords
        gopc     = ''gopass show -c                '';  ### Clipboard  Copy the password value into the clipboard
        gopca    = ''gopass cat                    '';  ### CAt        Print content of a secret to stdout, or insert from stdin
        gopcl    = ''gopass clone                  '';  ### CLone      Clone a store from git
        gopco    = ''gopass completion             '';  ### COmpletion Bash and ZSH completion
        gopcfg   = ''gopass config                 '';  ### ConFiG     Edit configuration
        gopcp    = ''gopass copy                   '';  ### CoPy       Copy secrets from one location to another
        gopn     = ''gopass create                 '';  ### New        Easy creation of new secrets
        goprm    = ''gopass delete                 '';  ### REmove     Remove secrets
        gope     = ''EDITOR=${editor} gopass edit  '';  ### Edit       Edit new or existing secrets
        gopf     = ''gopass find                   '';  ### Find       Search for secrets
        gopfsck  = ''gopass fsck                   '';  ### FSCK       Check store integrity
        gopg     = ''gopass generate               '';  ### Generate   Generate a new password
        gophist  = ''gopass history                '';  ### HISTory    Show password history
        gopin    = ''gopass init                   '';  ### INit       Initialize new password store.
        gopins   = ''gopass insert                 '';  ### INSert     Insert a new secret
        gopl     = ''gopass list                   '';  ### List       List existing secrets
        gopmnt   = ''gopass mounts                 '';  ### MouNTs     Edit mounted stores
        gopmv    = ''gopass move                   '';  ### MoVe       Move secrets from one location to another
        gopotp   = ''gopass otp                    '';  ### OTP        Generate time- or hmac-based tokens
        goppwgen = ''gopass pwgen                  '';  ### PWGEN      Generate passwords
        goprec   = ''gopass recipients             '';  ### RECipients Edit recipient permissions
        gopsh    = ''gopass show                   '';  ### SHow       Display a secret
        gopsc    = ''gopass show -C                '';  ### ShowClip   Display a secret and copy password to clipboard
        gopsum   = ''gopass sum                    '';  ### SUM        Compute the SHA256 checksum
        gopsync  = ''gopass sync                   '';  ### SYNC       Sync all local stores with their remotes
        goptpl   = ''gopass templates              '';  ### TemPLates  Edit templates
        gopu     = ''gopass update                 '';  ### Update     Check for updates
        gopv     = ''gopass version                '';  ### Version    Display version
        goph     = ''(){ gopass help ''${1} BTMN ;}'';  ### Help       Shows a list of commands or help for one command
        ### gopb -> dotLocal
      };
  };

  programs = {
    firefox.extensions  = with pkgs.nur.repos.rycee.firefox-addons; [ gopass-bridge ];
    chromium.extensions = [ "kkhfnlkhiapbiehimabddjbimfaijdhk" ];   ### gopass https://github.com/gopasspw/gopassbridge https://chrome.google.com/webstore/detail/gopass-bridge/kkhfnlkhiapbiehimabddjbimfaijdhk
  };
}


### old manual actions with cloning
# *** TODO initialize stores
# **** ignore errors
# #+begin_quote
# ❌ Failed to initialize mount .....

# Error: Failed to update config: failed to write config file
# #+end_quote
# **** general
# #+begin_src shell :results drawer
# gopass clone git@gitea.thesym.site:frank/gopassStore-general.git root
# #+end_src
# **** k8s
# #+begin_src shell :results drawer
# gopass clone git@gitea.thesym.site:infra/gopassStore-k8s.git k8s
# #+end_src
# **** thesym.site
# #+begin_src shell :results drawer
# gopass clone git@gitea.thesym.site:frank/gopassStore-thesym.site.git thesym.site
# #+end_src
# *** TODO import all required publicKeys
# **** list available publicKeys
# #+begin_src shell :results drawer
# gpg --with-fingerprint --list-public-keys
# #+end_src
# **** list required publicKeys
# #+begin_src shell :results drawer
# gopass recipient
# #+end_src
# **** onRemote
# ***** list keys
# #+begin_src shell :results drawer
# #+end_src
# ***** export keys
# #+begin_src shell :results drawer
# gpg --export -a <HASH-REQUIRED> > <EMAIL>.pub.asc
# #+end_src
# *** transfer
# #+begin_src shell :results drawer
# scp -rP <PORT> <USER>@<IP>:/home/<USER>/<EMAIL>.pub.asc /home/<USER>/<EMAIL>.pub.asc
# #+end_src
# *** import
# #+begin_src shell :results drawer
# gpg --import <EMAIL>.pub.asc
# #+end_src'');
