{ nixosConfig
, lib
, self
, ...
}:
{
  home = {
    ### DO not use recursive aliases - at least not for the keyword to search for
    shellAliases =
      let
        ifSudo      = lib.mkIf nixosConfig.security.sudo.enable;
        batWatchCmd = ''batwatch --language =syslog --wrap =never --style =header --command -n1'';
      in
      {
        ### quick cd
        ".."    = "cd .."          ;
        "..."   = "cd ../.."       ;
        "...."  = "cd ../../.."    ;
        "....." = "cd ../../../.." ;


        ### alias
        alrg = ''alias | rg''      ;  ### ALiasRG
        alal = ''alrg ^al''        ;  ### ALlALiases (listing aliases)


        ### btrfs
        bf   = ifSudo ''sudo btrfs''                 ;  ### BtrFs
        bff  = ifSudo ''sudo btrfs filesystem''      ;  ### BtrFs Filesystem
        bffl = ifSudo ''sudo btrfs filesystem label'';  ### BtrFs Filesystem Label
        bffd = ifSudo ''sudo btrfs filesystem df''   ;  ### BtrFs Filesystem Disk free
        bffs = ifSudo ''sudo btrfs filesystem show'' ;  ### BtrFs Filesystem Show
        bffu = ifSudo ''sudo btrfs filesystem usage'';  ### BtrFs Filesystem Usage


        ### delta
        deltas = ''delta -s ''        ;  ### DELTA Side-by-side


        ### editorconfig
        ecc = ''editorconfig-checker'';  ### EditorConfig-Checker


        ### git
        g = ''git''       ;


        ### grep
        grep = ''rg''     ;
        gi   = ''grep -i'';


        ### internet ip
        myip = ''dig +short myip.opendns.com @208.67.222.222 2>&1'';


        ### nix
        n    =        ''nix''                             ;
        np   =        ''n  profile''                      ;
        npi  =        ''np install''                      ;
        npr  =        ''np remove''                       ;  ### Nix Profile Remove
        ns   =        ''n  search --no-update-lock-file'' ;
        nf   =        ''n  flake''                        ;
        nl   =        ''n  log''                          ;
        nr   =        ''n  repl''                         ;  ### Nix Repl
        nrpk =        ''n  repl "<nixpkgs>"''             ;  ### Nix Repl PacKages
        nrfl =        ''n  repl flake.nix''               ;  ### Nix Repl FLake
        srch =        ''ns nixos''                        ;  ### nix SeaRCH
        orch =        ''ns override''                     ;  ### nix search Override [seaRCH]
        nrb  = ifSudo ''sudo nixos-rebuild''              ;
        mn   = ''
          manix "" | grep '^# ' | sed 's/^# \(.*\) (.*/\1/;s/ (.*//;s/^# //' | sk --preview="manix '{}'" | xargs manix
        '';


        ### help / documentation

        # alhlp ="";  ### TODO
        hmh  = ''man home-configuration.nix'' ;                               ### Help-Man-Homemanager
        hmn  = ''man      configuration.nix'' ;                               ### Help-Man-Nixos
        hmc  = ''man nix.conf''               ;                               ### Help-Man-nix.Conf

        hin  = ''nix-info -m''                ;                               ### Help-Info-Nix

        ### TODO dynamic username - extract to home.core??
        hvhs = ''nixos-option home-manager.users.frank.home.stateVersion'' ;  ### Help-Version-HomeState
        hvn  = ''nixos-version''                                           ;  ### Help-Version-Nix
        hnl  = ''nix-locate''                                              ;  ### Help-Nix-Locate
        hnx  = ''nixos-help''                                              ;  ### Help-NiXos
        hcp  = ''bat /etc/currentSystemPackages -l s''                     ;  ### Help-CurrentPackages ### TODO write language highlighting only name without version

        ### TODO fix nixos-option
        ### does only work here - why not in tools/nixTools - different self WHY?
        nixos-option = ''nixos-option -I nixpkgs=${self}/lib/compat'';

        ### sudo
        sdv = ifSudo ''sudo -E''           ; ### SuDoenV
        sdi = ifSudo ''sudo -i''           ; ### SuDologIn
        sde = ifSudo ''sudoedit''          ; ### SuDoEdit
        sdp = ifSudo ''sudo $(fc -ln -1)'' ; ### SuDoPlease
        sdr = ifSudo ''sudo su''           ; ### SuDo Root

        ### top
        top = ''btm'';

        ### touch
        twd = ''install -m 644 -D /dev/null'';  ### TouchWithDirectories

        ### mount
        ma  = ifSudo ''sudo mount -a'';             ### Mount All

        ### systemd
        sys       =    ifSudo '' sudo systemctl''                                ; ### Sudo SYStemcontrol
        st        =           ''      systemctl        status''                  ; ###      STatus
        up        =    ifSudo '' sudo systemctl        start''                   ; ###      UP
        dn        =    ifSudo '' sudo systemctl        stop''                    ; ###      DowN
        re        =    ifSudo '' sudo systemctl        restart''                 ; ###      REstart
        usys      =           ''      systemctl --user''                         ; ### User SYStemcontrol
        ust       =           ''      systemctl --user status''                  ; ### User STatus
        uup       =           ''      systemctl --user start''                   ; ### User Up
        udn       =           ''      systemctl --user stop''                    ; ### User DowN
        ure       =           ''      systemctl --user restart''                 ; ### User REstart

        syslmnt   =           '' sudo systemctl        --type mount''            ; ### Sudo SYStemcontrol MouNT
        syslmnta  =           '' sudo systemctl        --type mount      --all'' ; ### Sudo SYStemcontrol MouNT           All

        sysld     =           '' sudo systemctl        list-dependencies''       ; ### Sudo SYStemcontrol List Depend
        syslda    =           '' sudo systemctl        list-dependencies --all'' ; ### Sudo SYStemcontrol List Depend     All
        syslj     =           '' sudo systemctl        list-jobs''               ; ### Sudo SYStemcontrol List Jobs
        syslja    =           '' sudo systemctl        list-jobs         --all'' ; ### Sudo SYStemcontrol List Jobs       All
        syslm     =           '' sudo systemctl        list-machines''           ; ### Sudo SYStemcontrol List Machines
        syslma    =           '' sudo systemctl        list-machines     --all'' ; ### Sudo SYStemcontrol List Machines   All
        sysls     =           '' sudo systemctl        list-sockets''            ; ### Sudo SYStemcontrol List Sockets
        syslsa    =           '' sudo systemctl        list-sockets      --all'' ; ### Sudo SYStemcontrol List Sockets    All
        syslt     =           '' sudo systemctl        list-timers''             ; ### Sudo SYStemcontrol List Timers
        syslta    =           '' sudo systemctl        list-timers       --all'' ; ### Sudo SYStemcontrol List Timers     All
        syslf     =           '' sudo systemctl        list-unit-files''         ; ### Sudo SYStemcontrol List unitsFiles
        syslfa    =           '' sudo systemctl        list-unit-files   --all'' ; ### Sudo SYStemcontrol List unitsFiles All
        syslu     =           '' sudo systemctl        list-units''              ; ### Sudo SYStemcontrol List Units
        syslua    =           '' sudo systemctl        list-units        --all'' ; ### Sudo SYStemcontrol List Units      All

        usysld    =           ''      systemctl --user list-dependencies''       ; ### User SYStemcontrol List Depend
        usyslda   =           ''      systemctl --user list-dependencies --all'' ; ### User SYStemcontrol List Depend     All
        usyslj    =           ''      systemctl --user list-jobs''               ; ### User SYStemcontrol List Jobs
        usyslja   =           ''      systemctl --user list-jobs         --all'' ; ### User SYStemcontrol List Jobs       All
        usyslm    =           ''      systemctl --user list-machines''           ; ### User SYStemcontrol List Machines
        usyslma   =           ''      systemctl --user list-machines     --all'' ; ### User SYStemcontrol List Machines   All
        usysls    =           ''      systemctl --user list-sockets''            ; ### User SYStemcontrol List Sockets
        usyslsa   =           ''      systemctl --user list-sockets      --all'' ; ### User SYStemcontrol List Sockets    All
        usyslt    =           ''      systemctl --user list-timers''             ; ### User SYStemcontrol List Timers
        usyslta   =           ''      systemctl --user list-timers       --all'' ; ### User SYStemcontrol List Timers     All
        usyslf    =           ''      systemctl --user list-unit-files''         ; ### User SYStemcontrol List unitsFiles
        usyslfa   =           ''      systemctl --user list-unit-files   --all'' ; ### User SYStemcontrol List unitsFiles All
        usyslu    =           ''      systemctl --user list-units''              ; ### User SYStemcontrol List Units
        usyslua   =           ''      systemctl --user list-units        --all'' ; ### User SYStemcontrol List Units      All

        jl        =           ''     journalctl                ''                ; ###      JournalcontroL
        jlu       =           ''     journalctl              -u''                ; ###      JournalcontroL Unit
        jlb       =           ''     journalctl           -b   ''                ; ###      JournalcontroL Boot
        jlbu      =           ''     journalctl           -b -u''                ; ###
        jlfuc     = ''${batWatchCmd} journalctl        -f    -u''                ; ###      JournalctLFollowUnitColored

        ujl       =           ''     journalctl --user         ''                ; ### User JournalcontroL
        ujlu      =           ''     journalctl --user       -u''                ; ### User JournalcontroL Unit
        ujlb      =           ''     journalctl --user    -b   ''                ; ### User JournalcontroL Boot
        ujlbu     =           ''     journalctl --user    -b -u''                ; ###
        ujlfuc    = ''${batWatchCmd} journalctl --user -f    -u''                ; ### User JournalctLFollowUnitColored

      };
  };
}
