{ profiles, ... }:
with profiles; rec
{
  base     = [ core                                                                              ];

  debug    = [ autologin.mainUser filemanager.ranger editor.vim                                  ];
  debugR   = [ autologin.root     filemanager.ranger editor.vim                                  ];
  # debugG = [                    filemanager.ranger editor.vim                                  ]; ### TODO add graphical

  docLocal = [ domain.local.domain domain.local.doc networking.nameserver services.documentation ];
}
