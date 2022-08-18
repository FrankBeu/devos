{ ... }:
{
  home = {
    ### do NOT use recursive aliases - at least not for the keyword to search for
    shellAliases = {
      dt   = ''dart''                                        ;### DarT
      dta  = ''dart analyze''                                ;### DarT Analyze
      dtp  = ''dart pub''                                    ;### DarT Pub
      dtr  = ''dart run''                                    ;### DarT Run
      dtcp = ''dart compile''                                ;### DarT ComPile
      dtcr = ''dart create''                                 ;### DarT CReate
      dtfi = ''dart fix''                                    ;### DarT FIx
      dtfo = ''dart format''                                 ;### DarT FOrmat
      dtte = ''dart test''                                   ;### DarT TEst
      dtbr = ''dart run build_runner build''                 ;### DarT BuildRunner
      dtdc = ''dartdoc''                                     ;### DarT DoC
    };
  };
}
