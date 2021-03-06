{ profiles, ... }:
with profiles; rec
{
  base        = [ core                                                                       ];

  debug       = [ autologin.variable filemanager.ranger editor.vim                           ];        ### add nix-options
  debugR      = [ autologin.root     filemanager.ranger editor.vim                           ];
  # debugG    = [                    filemanager.ranger editor.vim                           ] ++ i3 ; ### TODO add graphical

  dnsRegular  = [ domain.server networking.nameserver.regular                                ];
  # dnsSecure = [                                                                            ];        ### TODO

  docLocal    = [ dnsRegular domain.local.domain domain.local.doc services.documentation bud ];  ### budLocalFlakeCloneLocation is used extensively throughout the documentation

  gnome       = [ display.manager.gdm     display.gnome                                      ];
  i3          = [ display.manager.lightdm display.i3    display.statusBar.i3statusBar        ];
  # sway      = [                                         ];                 ### TODO

  rustTools   = with tools; [ bandwhich exa grex hyperfine procs tokei zoxide                ];
  virtmanager = [ virtualisation.libvirtd  virtualisation.virtmanager                        ];
}
