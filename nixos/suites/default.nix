{ profiles, ... }:
with profiles; rec
{
  base     = [ core ];

  debug    = [ autologin.mainUser filemanager.ranger editor.vim ];
  debugR   = [ autologin.root     filemanager.ranger editor.vim ];
  # debugG = [                    filemanager.ranger editor.vim ] ++ i3 ; ### TODO add graphical

  dnsRegular = [
    domain.server
    networking.nameserver.regular
  ];

  docLocal = [
    dnsRegular
    domain.local.domain
    domain.local.doc
    services.documentation
  ];

  gnome = [ display.manager.gdm     display.gnome                               sound ];
  i3    = [ display.manager.lightdm display.i3    display.statusBar.i3statusBar sound ];
  # sway  = [                                         ];
}
