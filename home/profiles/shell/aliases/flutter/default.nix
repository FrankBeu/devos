{ ... }:
{
  home = {
    ### do NOT use recursive aliases - at least not for the keyword to search for
    shellAliases = {
        f     =     ''flutter''                                   ;### Flutter
        fv    =     ''flutter -- version''                        ;### Flutter Version
        fp    =     ''flutter pub''                               ;### Flutter Pub
        fpa   =     ''flutter pub add ''                          ;### Flutter Pub  Add
        fpad  =     ''flutter pub add --dev''                     ;### Flutter Pub  Add Dev
        fpg   =     ''flutter pub get''                           ;### Flutter Pub  Get
        fpu   =     ''flutter pub upgrade''                       ;### Flutter Pub  Upgrade
        fpr   =     ''flutter pub remove''                        ;### Flutter Pub  Remove
        fprb  =     ''flutter pub run build_runner build''                             ;### Flutter Pub Run   Buildrunner
        fprbd =     ''flutter pub run build_runner build --delete-conflicting-outputs'';### Flutter Pub Run   Buildrunner Deleteconflicting
        fprw  =     ''flutter pub run build_runner watch''                             ;### Flutter Pub Watch Buildrunner
        fprwd =     ''flutter pub run build_runner watch --delete-conflicting-outputs'';### Flutter Pub Watch Buildrunner Deleteconflicting
        fhf   = ''(){ flutter  "''${@}" --help           BTMN}''  ;### Flutter Help Flag
        fhfv  = ''(){ flutter  "''${@}" --help --verbose BTMN}''  ;### Flutter Help Flag Verbose
        fh    =     ''flutter help ''                             ;### Flutter Help              <command>
        fhv   =     ''flutter help --verbose''                    ;### Flutter Help      Verbose <command>
        fr    =     ''flutter run''                               ;### Flutter Run
        frd   =     ''flutter run --device-id''                   ;### Flutter Run  Device
        ft    =     ''flutter test''                              ;### Flutter Test
        ftc   =     ''flutter test --coverage''                   ;### Flutter Test
        ftt   =     ''flutter test --tags''                       ;### Flutter Test Tag
        ftx   =     ''flutter test --exclude-tags''               ;### Flutter Test eXclude-tag
        fttg  =     ''flutter test --tags golden''                ;### Flutter Test Tag Golden
        ftug  =     ''flutter test --update-golden''              ;### Flutter Test Update Golden
        ftuga =     ''flutter test --update-golden --tags=golden'';### Flutter Test Update Golden All
    };
  };
}
