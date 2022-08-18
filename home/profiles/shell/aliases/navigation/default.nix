{ ... }:
{
  home = {
    ### do NOT use recursive aliases - at least not for the keyword to search for
    shellAliases = {
      ### quick cd
      ".."    = ''cd ..''                 ;
      "..."   = ''cd ../..''              ;
      "...."  = ''cd ../../..''           ;
      "....." = ''cd ../../../..''        ;

      cdf     = ''(){ cd "''${@}"(:h)}''  ;### ChangeDirectory File

      cdgr    = ''cd-gitroot''            ;### CD-GitRoot (zshPlugin)
    };
  };
}
