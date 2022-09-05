{ lib
, nixosConfig
, ...
}:
{
  home = {
    ### do NOT use recursive aliases - at least not for the keyword to search for
    shellAliases =
      let
        ifSudo      = lib.mkIf nixosConfig.security.sudo.enable;
      in
      {
        ### nix
        n    =        ''nix''                                       ;
        nb   =        ''nix  build''                                ;
        nd   =        ''nix  develop''                              ;
        np   =        ''nix  profile''                              ;
        npi  =        ''nix  profile install''                      ;### Nix Profile Install
        npr  =        ''nix  profile remove''                       ;### Nix Profile Remove
        nsh  =        ''nix  shell''                                ;
        ns   =        ''nix  search --no-update-lock-file''         ;
        nsn  =        ''nix  search --no-update-lock-file nixos''   ;### Nix Search Nixos
        nso  =        ''nix  search --no-update-lock-file override'';### Nix Search Override
        nf   =        ''nix  flake''                                ;
        nl   =        ''nix  log''                                  ;
        nr   =        ''nix  repl''                                 ;### Nix Repl
        nrpk =        ''nix  repl "<nixpkgs>"''                     ;### Nix Repl PacKages
        nrfl =        ''nix  repl flake.nix''                       ;### Nix Repl FLake
        nrb  = ifSudo ''sudo nixos-rebuild''                        ;
        nvf =         ''nvfetcher''                                 ;### NVFetcher
        mn   =        ''manix "" | grep '^# ' | sed 's/^# \(.*\) (.*/\1/;s/ (.*//;s/^# //' | sk --preview="manix '{}'" | xargs manix'';
      };
  };
}
