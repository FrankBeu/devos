###
##
# * chromium
#
# { pkgs, ... }:
{pkgs, variables, ...}:
let user = variables.mainUser;
in
{
  environment = {
    systemPackages = with pkgs; [
      chromium
    ];
  };

  programs.chromium = {
    enable     = true;  ### needed to install plugins

    ###
    ##
    # ** extensions
    #
    extensions = [
      "eljbmlghnomdjgdjmbdekegdkbabckhm" ### dart-debug     https://github.com/dart-lang/webdev/tree/master/dwds https://chrome.google.com/webstore/detail/dart-debug-extension/eljbmlghnomdjgdjmbdekegdkbabckhm
      "kkhfnlkhiapbiehimabddjbimfaijdhk" ### gopass         https://github.com/gopasspw/gopassbridge             https://chrome.google.com/webstore/detail/gopass-bridge/kkhfnlkhiapbiehimabddjbimfaijdhk
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" ### ublock         https://github.com/gorhill/uBlock                    https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm
      "dbepggeogbaibhgnhhndojpepiihcmeb" ### vimium         https://vimium.github.io/                            https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb
      "gppongmhjkpfnbhagpmjfkannfbllamg" ### wappalyzer     https://www.wappalyzer.com/                          https://chrome.google.com/webstore/detail/wappalyzer/gppongmhjkpfnbhagpmjfkannfbllamg
      "bcjindcccaagfpapjjmafapmmgkkhgoa" ### JSONFormatter  https://github.com/callumlocke/json-formatter        https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa
      "enadmddipfodpmlnaajhofpkiephdhhe" ### linkToElement  https://github.com/dergachev/link-to-element         https://chrome.google.com/webstore/detail/link-to-element/enadmddipfodpmlnaajhofpkiephdhhe
      "nhppnhnadikeniijclnghjfblnojgige" ### Show Anchors                                                        https://chrome.google.com/webstore/detail/show-anchors/nhppnhnadikeniijclnghjfblnojgige
      "nkbihfbeogaeaoehlefnkodbefgpgknn" ### metamask       https://metamask.io/                                 https://chrome.google.com/webstore/detail/metamask/nk
      "ajjloplcjllkammemhenacfjcccockde" ### Tab-Snap       https://github.com/tdj28/tab-snap                    https://chrome.google.com/webstore/detail/tab-snap/ajjloplcjllkammemhenacfjcccockde
      "micdllihgoppmejpecmkilggmaagfdmb" ### TabCopy        https://tabcopy.com                                  https://chrome.google.com/webstore/detail/tabcopy/micdllihgoppmejpecmkilggmaagfdmb
    ];

    ###
    ##
    # *** deprecated
    #
    # simple url copies title
  };

  ###
  ##
  # ** manualActions
  #
  home-manager.users.${user.name} = {...}:
  {
    home.file.".nixosInstallation/manualAction.org".text = pkgs.lib.mkDefault( pkgs.lib.mkOrder 70 ''
      ** chromium (SYSTEM)
      *** TODO extension-keybindings
      chrome://extensions/shortcuts
      **** gopass
      Alt + Shift + G
      **** wappalyzer
      Alt + Shift + W
      *** vimium
      **** TODO keybindings
      https://github.com/philc/vimium/wiki/Key-Mappings
      ***** add to 'Custom key mappings'
      [[chrome-extension://dbepggeogbaibhgnhhndojpepiihcmeb/pages/options.html][vimiumConfiguration]]
      #+begin_example shell
      mapkey j h
      mapkey k k
      mapkey l j
      mapkey ; l
      mapkey h :

      mapkey K H
      mapkey J J
      mapkey : K
      mapkey L L
      mapkey h ;
      #+end_example
      keybindings are taken from tridactyl
      ; and : are not bound anyway'');
  };
  ### TODO: import =/etc/nixos/config/tools/chromium/vimium/vimium-options.json= instead

}
