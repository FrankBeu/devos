{
  kc        = ''kubecolor                                                         '';

  kcg       = ''kubecolor get                                                     '';

  kcgp      = ''kubecolor get pod                                                 '';
  kcgpw     = ''kubecolor get pod                                             -w  '';
  kcgpy     = ''kubecolor get pod                                     -o yaml     '';
  kcgpj     = ''kubecolor get pod                                     -o json     '';
  kcgpwy    = ''kubecolor get pod                                     -o yaml -w  '';
  kcgpwj    = ''kubecolor get pod                                     -o json -w  '';
  kcgpyw    = ''kubecolor get pod                                     -o yaml -w  '';
  kcgpjw    = ''kubecolor get pod                                     -o json -w  '';
  kcgpa     = ''kubecolor get pod                    --all-namespaces             '';
  kcgpwa    = ''kubecolor get pod                    --all-namespaces         -w  '';
  kcgpaw    = ''kubecolor get pod                    --all-namespaces         -w  '';
  kcgpya    = ''kubecolor get pod                    --all-namespaces -o yaml     '';
  kcgpja    = ''kubecolor get pod                    --all-namespaces -o json     '';
  kcgpay    = ''kubecolor get pod                    --all-namespaces -o yaml     '';
  kcgpaj    = ''kubecolor get pod                    --all-namespaces -o json     '';
  kcgpwya   = ''kubecolor get pod                    --all-namespaces -o yaml -w  '';
  kcgpwja   = ''kubecolor get pod                    --all-namespaces -o json -w  '';
  kcgpywa   = ''kubecolor get pod                    --all-namespaces -o yaml -w  '';
  kcgpjwa   = ''kubecolor get pod                    --all-namespaces -o json -w  '';
  kcgpawy   = ''kubecolor get pod                    --all-namespaces -o yaml -w  '';
  kcgpawj   = ''kubecolor get pod                    --all-namespaces -o json -w  '';
  kcgpway   = ''kubecolor get pod                    --all-namespaces -o yaml -w  '';
  kcgpwaj   = ''kubecolor get pod                    --all-namespaces -o json -w  '';
  kcgpyaw   = ''kubecolor get pod                    --all-namespaces -o yaml -w  '';
  kcgpjaw   = ''kubecolor get pod                    --all-namespaces -o json -w  '';
  kcgpayw   = ''kubecolor get pod                    --all-namespaces -o yaml -w  '';
  kcgpajw   = ''kubecolor get pod                    --all-namespaces -o json -w  '';

  kcgd      = ''kubecolor get deployment                                          '';
  kcgdw     = ''kubecolor get deployment                                      -w  '';
  kcgdy     = ''kubecolor get deployment                              -o yaml     '';
  kcgdj     = ''kubecolor get deployment                              -o json     '';
  kcgdwy    = ''kubecolor get deployment                              -o yaml -w  '';
  kcgdwj    = ''kubecolor get deployment                              -o json -w  '';
  kcgdyw    = ''kubecolor get deployment                              -o yaml -w  '';
  kcgdjw    = ''kubecolor get deployment                              -o json -w  '';
  kcgda     = ''kubecolor get deployment             --all-namespaces             '';
  kcgdwa    = ''kubecolor get deployment             --all-namespaces         -w  '';
  kcgdaw    = ''kubecolor get deployment             --all-namespaces         -w  '';
  kcgdya    = ''kubecolor get deployment             --all-namespaces -o yaml     '';
  kcgdja    = ''kubecolor get deployment             --all-namespaces -o json     '';
  kcgday    = ''kubecolor get deployment             --all-namespaces -o yaml     '';
  kcgdaj    = ''kubecolor get deployment             --all-namespaces -o json     '';
  kcgdwya   = ''kubecolor get deployment             --all-namespaces -o yaml -w  '';
  kcgdwja   = ''kubecolor get deployment             --all-namespaces -o json -w  '';
  kcgdywa   = ''kubecolor get deployment             --all-namespaces -o yaml -w  '';
  kcgdjwa   = ''kubecolor get deployment             --all-namespaces -o json -w  '';
  kcgdawy   = ''kubecolor get deployment             --all-namespaces -o yaml -w  '';
  kcgdawj   = ''kubecolor get deployment             --all-namespaces -o json -w  '';
  kcgdway   = ''kubecolor get deployment             --all-namespaces -o yaml -w  '';
  kcgdwaj   = ''kubecolor get deployment             --all-namespaces -o json -w  '';
  kcgdyaw   = ''kubecolor get deployment             --all-namespaces -o yaml -w  '';
  kcgdjaw   = ''kubecolor get deployment             --all-namespaces -o json -w  '';
  kcgdayw   = ''kubecolor get deployment             --all-namespaces -o yaml -w  '';
  kcgdajw   = ''kubecolor get deployment             --all-namespaces -o json -w  '';

  kcgs      = ''kubecolor get service                                             '';
  kcgsw     = ''kubecolor get service                                         -w  '';
  kcgsy     = ''kubecolor get service                                 -o yaml     '';
  kcgsj     = ''kubecolor get service                                 -o json     '';
  kcgswy    = ''kubecolor get service                                 -o yaml -w  '';
  kcgswj    = ''kubecolor get service                                 -o json -w  '';
  kcgsyw    = ''kubecolor get service                                 -o yaml -w  '';
  kcgsjw    = ''kubecolor get service                                 -o json -w  '';
  kcgsa     = ''kubecolor get service                --all-namespaces             '';
  kcgswa    = ''kubecolor get service                --all-namespaces         -w  '';
  kcgsaw    = ''kubecolor get service                --all-namespaces         -w  '';
  kcgsya    = ''kubecolor get service                --all-namespaces -o yaml     '';
  kcgsja    = ''kubecolor get service                --all-namespaces -o json     '';
  kcgsay    = ''kubecolor get service                --all-namespaces -o yaml     '';
  kcgsaj    = ''kubecolor get service                --all-namespaces -o json     '';
  kcgswya   = ''kubecolor get service                --all-namespaces -o yaml -w  '';
  kcgswja   = ''kubecolor get service                --all-namespaces -o json -w  '';
  kcgsywa   = ''kubecolor get service                --all-namespaces -o yaml -w  '';
  kcgsjwa   = ''kubecolor get service                --all-namespaces -o json -w  '';
  kcgsawy   = ''kubecolor get service                --all-namespaces -o yaml -w  '';
  kcgsawj   = ''kubecolor get service                --all-namespaces -o json -w  '';
  kcgsway   = ''kubecolor get service                --all-namespaces -o yaml -w  '';
  kcgswaj   = ''kubecolor get service                --all-namespaces -o json -w  '';
  kcgsyaw   = ''kubecolor get service                --all-namespaces -o yaml -w  '';
  kcgsjaw   = ''kubecolor get service                --all-namespaces -o json -w  '';
  kcgsayw   = ''kubecolor get service                --all-namespaces -o yaml -w  '';
  kcgsajw   = ''kubecolor get service                --all-namespaces -o json -w  '';

  kcgn      = ''kubecolor get node                                                '';
  kcgnw     = ''kubecolor get node                                            -w  '';
  kcgny     = ''kubecolor get node                                    -o yaml     '';
  kcgnj     = ''kubecolor get node                                    -o json     '';
  kcgnwy    = ''kubecolor get node                                    -o yaml -w  '';
  kcgnwj    = ''kubecolor get node                                    -o json -w  '';
  kcgnyw    = ''kubecolor get node                                    -o yaml -w  '';
  kcgnjw    = ''kubecolor get node                                    -o json -w  '';
  kcgna     = ''kubecolor get node                   --all-namespaces             '';
  kcgnwa    = ''kubecolor get node                   --all-namespaces         -w  '';
  kcgnaw    = ''kubecolor get node                   --all-namespaces         -w  '';
  kcgnya    = ''kubecolor get node                   --all-namespaces -o yaml     '';
  kcgnja    = ''kubecolor get node                   --all-namespaces -o json     '';
  kcgnay    = ''kubecolor get node                   --all-namespaces -o yaml     '';
  kcgnaj    = ''kubecolor get node                   --all-namespaces -o json     '';
  kcgnwya   = ''kubecolor get node                   --all-namespaces -o yaml -w  '';
  kcgnwja   = ''kubecolor get node                   --all-namespaces -o json -w  '';
  kcgnywa   = ''kubecolor get node                   --all-namespaces -o yaml -w  '';
  kcgnjwa   = ''kubecolor get node                   --all-namespaces -o json -w  '';
  kcgnawy   = ''kubecolor get node                   --all-namespaces -o yaml -w  '';
  kcgnawj   = ''kubecolor get node                   --all-namespaces -o json -w  '';
  kcgnway   = ''kubecolor get node                   --all-namespaces -o yaml -w  '';
  kcgnwaj   = ''kubecolor get node                   --all-namespaces -o json -w  '';
  kcgnyaw   = ''kubecolor get node                   --all-namespaces -o yaml -w  '';
  kcgnjaw   = ''kubecolor get node                   --all-namespaces -o json -w  '';
  kcgnayw   = ''kubecolor get node                   --all-namespaces -o yaml -w  '';
  kcgnajw   = ''kubecolor get node                   --all-namespaces -o json -w  '';

  kcgi      = ''kubecolor get ingress                                             '';
  kcgiw     = ''kubecolor get ingress                                         -w  '';
  kcgiy     = ''kubecolor get ingress                                 -o yaml     '';
  kcgij     = ''kubecolor get ingress                                 -o json     '';
  kcgiwy    = ''kubecolor get ingress                                 -o yaml -w  '';
  kcgiwj    = ''kubecolor get ingress                                 -o json -w  '';
  kcgiyw    = ''kubecolor get ingress                                 -o yaml -w  '';
  kcgijw    = ''kubecolor get ingress                                 -o json -w  '';
  kcgia     = ''kubecolor get ingress                --all-namespaces             '';
  kcgiwa    = ''kubecolor get ingress                --all-namespaces         -w  '';
  kcgiaw    = ''kubecolor get ingress                --all-namespaces         -w  '';
  kcgiya    = ''kubecolor get ingress                --all-namespaces -o yaml     '';
  kcgija    = ''kubecolor get ingress                --all-namespaces -o json     '';
  kcgiay    = ''kubecolor get ingress                --all-namespaces -o yaml     '';
  kcgiaj    = ''kubecolor get ingress                --all-namespaces -o json     '';
  kcgiwya   = ''kubecolor get ingress                --all-namespaces -o yaml -w  '';
  kcgiwja   = ''kubecolor get ingress                --all-namespaces -o json -w  '';
  kcgiywa   = ''kubecolor get ingress                --all-namespaces -o yaml -w  '';
  kcgijwa   = ''kubecolor get ingress                --all-namespaces -o json -w  '';
  kcgiawy   = ''kubecolor get ingress                --all-namespaces -o yaml -w  '';
  kcgiawj   = ''kubecolor get ingress                --all-namespaces -o json -w  '';
  kcgiway   = ''kubecolor get ingress                --all-namespaces -o yaml -w  '';
  kcgiwaj   = ''kubecolor get ingress                --all-namespaces -o json -w  '';
  kcgiyaw   = ''kubecolor get ingress                --all-namespaces -o yaml -w  '';
  kcgijaw   = ''kubecolor get ingress                --all-namespaces -o json -w  '';
  kcgiayw   = ''kubecolor get ingress                --all-namespaces -o yaml -w  '';
  kcgiajw   = ''kubecolor get ingress                --all-namespaces -o json -w  '';

  kcgr      = ''kubecolor get role                                                '';
  kcgrw     = ''kubecolor get role                                            -w  '';
  kcgry     = ''kubecolor get role                                    -o yaml     '';
  kcgrj     = ''kubecolor get role                                    -o json     '';
  kcgrwy    = ''kubecolor get role                                    -o yaml -w  '';
  kcgrwj    = ''kubecolor get role                                    -o json -w  '';
  kcgryw    = ''kubecolor get role                                    -o yaml -w  '';
  kcgrjw    = ''kubecolor get role                                    -o json -w  '';
  kcgra     = ''kubecolor get role                   --all-namespaces             '';
  kcgrwa    = ''kubecolor get role                   --all-namespaces         -w  '';
  kcgraw    = ''kubecolor get role                   --all-namespaces         -w  '';
  kcgrya    = ''kubecolor get role                   --all-namespaces -o yaml     '';
  kcgrja    = ''kubecolor get role                   --all-namespaces -o json     '';
  kcgray    = ''kubecolor get role                   --all-namespaces -o yaml     '';
  kcgraj    = ''kubecolor get role                   --all-namespaces -o json     '';
  kcgrwya   = ''kubecolor get role                   --all-namespaces -o yaml -w  '';
  kcgrwja   = ''kubecolor get role                   --all-namespaces -o json -w  '';
  kcgrywa   = ''kubecolor get role                   --all-namespaces -o yaml -w  '';
  kcgrjwa   = ''kubecolor get role                   --all-namespaces -o json -w  '';
  kcgrawy   = ''kubecolor get role                   --all-namespaces -o yaml -w  '';
  kcgrawj   = ''kubecolor get role                   --all-namespaces -o json -w  '';
  kcgrway   = ''kubecolor get role                   --all-namespaces -o yaml -w  '';
  kcgrwaj   = ''kubecolor get role                   --all-namespaces -o json -w  '';
  kcgryaw   = ''kubecolor get role                   --all-namespaces -o yaml -w  '';
  kcgrjaw   = ''kubecolor get role                   --all-namespaces -o json -w  '';
  kcgrayw   = ''kubecolor get role                   --all-namespaces -o yaml -w  '';
  kcgrajw   = ''kubecolor get role                   --all-namespaces -o json -w  '';

  kcgrb     = ''kubecolor get rolebinding                                         '';
  kcgrbw    = ''kubecolor get rolebinding                                     -w  '';
  kcgrby    = ''kubecolor get rolebinding                             -o yaml     '';
  kcgrbj    = ''kubecolor get rolebinding                             -o json     '';
  kcgrbwy   = ''kubecolor get rolebinding                             -o yaml -w  '';
  kcgrbwj   = ''kubecolor get rolebinding                             -o json -w  '';
  kcgrbyw   = ''kubecolor get rolebinding                             -o yaml -w  '';
  kcgrbjw   = ''kubecolor get rolebinding                             -o json -w  '';
  kcgrba    = ''kubecolor get rolebinding            --all-namespaces             '';
  kcgrbwa   = ''kubecolor get rolebinding            --all-namespaces         -w  '';
  kcgrbaw   = ''kubecolor get rolebinding            --all-namespaces         -w  '';
  kcgrbya   = ''kubecolor get rolebinding            --all-namespaces -o yaml     '';
  kcgrbja   = ''kubecolor get rolebinding            --all-namespaces -o json     '';
  kcgrbay   = ''kubecolor get rolebinding            --all-namespaces -o yaml     '';
  kcgrbaj   = ''kubecolor get rolebinding            --all-namespaces -o json     '';
  kcgrbwya  = ''kubecolor get rolebinding            --all-namespaces -o yaml -w  '';
  kcgrbwja  = ''kubecolor get rolebinding            --all-namespaces -o json -w  '';
  kcgrbywa  = ''kubecolor get rolebinding            --all-namespaces -o yaml -w  '';
  kcgrbjwa  = ''kubecolor get rolebinding            --all-namespaces -o json -w  '';
  kcgrbawy  = ''kubecolor get rolebinding            --all-namespaces -o yaml -w  '';
  kcgrbawj  = ''kubecolor get rolebinding            --all-namespaces -o json -w  '';
  kcgrbway  = ''kubecolor get rolebinding            --all-namespaces -o yaml -w  '';
  kcgrbwaj  = ''kubecolor get rolebinding            --all-namespaces -o json -w  '';
  kcgrbyaw  = ''kubecolor get rolebinding            --all-namespaces -o yaml -w  '';
  kcgrbjaw  = ''kubecolor get rolebinding            --all-namespaces -o json -w  '';
  kcgrbayw  = ''kubecolor get rolebinding            --all-namespaces -o yaml -w  '';
  kcgrbajw  = ''kubecolor get rolebinding            --all-namespaces -o json -w  '';

  kcgcr     = ''kubecolor get clusterrole                                         '';
  kcgcrw    = ''kubecolor get clusterrole                                     -w  '';
  kcgcry    = ''kubecolor get clusterrole                             -o yaml     '';
  kcgcrj    = ''kubecolor get clusterrole                             -o json     '';
  kcgcrwy   = ''kubecolor get clusterrole                             -o yaml -w  '';
  kcgcrwj   = ''kubecolor get clusterrole                             -o json -w  '';
  kcgcryw   = ''kubecolor get clusterrole                             -o yaml -w  '';
  kcgcrjw   = ''kubecolor get clusterrole                             -o json -w  '';
  kcgcra    = ''kubecolor get clusterrole            --all-namespaces             '';
  kcgcrwa   = ''kubecolor get clusterrole            --all-namespaces         -w  '';
  kcgcraw   = ''kubecolor get clusterrole            --all-namespaces         -w  '';
  kcgcrya   = ''kubecolor get clusterrole            --all-namespaces -o yaml     '';
  kcgcrja   = ''kubecolor get clusterrole            --all-namespaces -o json     '';
  kcgcray   = ''kubecolor get clusterrole            --all-namespaces -o yaml     '';
  kcgcraj   = ''kubecolor get clusterrole            --all-namespaces -o json     '';
  kcgcrwya  = ''kubecolor get clusterrole            --all-namespaces -o yaml -w  '';
  kcgcrwja  = ''kubecolor get clusterrole            --all-namespaces -o json -w  '';
  kcgcrywa  = ''kubecolor get clusterrole            --all-namespaces -o yaml -w  '';
  kcgcrjwa  = ''kubecolor get clusterrole            --all-namespaces -o json -w  '';
  kcgcrawy  = ''kubecolor get clusterrole            --all-namespaces -o yaml -w  '';
  kcgcrawj  = ''kubecolor get clusterrole            --all-namespaces -o json -w  '';
  kcgcrway  = ''kubecolor get clusterrole            --all-namespaces -o yaml -w  '';
  kcgcrwaj  = ''kubecolor get clusterrole            --all-namespaces -o json -w  '';
  kcgcryaw  = ''kubecolor get clusterrole            --all-namespaces -o yaml -w  '';
  kcgcrjaw  = ''kubecolor get clusterrole            --all-namespaces -o json -w  '';
  kcgcrayw  = ''kubecolor get clusterrole            --all-namespaces -o yaml -w  '';
  kcgcrajw  = ''kubecolor get clusterrole            --all-namespaces -o json -w  '';

  kcgcrb    = ''kubecolor get clusterrolebinding                                  '';
  kcgcrbw   = ''kubecolor get clusterrolebinding                              -w  '';
  kcgcrby   = ''kubecolor get clusterrolebinding                      -o yaml     '';
  kcgcrbj   = ''kubecolor get clusterrolebinding                      -o json     '';
  kcgcrbwy  = ''kubecolor get clusterrolebinding                      -o yaml -w  '';
  kcgcrbwj  = ''kubecolor get clusterrolebinding                      -o json -w  '';
  kcgcrbyw  = ''kubecolor get clusterrolebinding                      -o yaml -w  '';
  kcgcrbjw  = ''kubecolor get clusterrolebinding                      -o json -w  '';
  kcgcrba   = ''kubecolor get clusterrolebinding     --all-namespaces             '';
  kcgcrbwa  = ''kubecolor get clusterrolebinding     --all-namespaces         -w  '';
  kcgcrbaw  = ''kubecolor get clusterrolebinding     --all-namespaces         -w  '';
  kcgcrbya  = ''kubecolor get clusterrolebinding     --all-namespaces -o yaml     '';
  kcgcrbja  = ''kubecolor get clusterrolebinding     --all-namespaces -o json     '';
  kcgcrbay  = ''kubecolor get clusterrolebinding     --all-namespaces -o yaml     '';
  kcgcrbaj  = ''kubecolor get clusterrolebinding     --all-namespaces -o json     '';
  kcgcrbwya = ''kubecolor get clusterrolebinding     --all-namespaces -o yaml -w  '';
  kcgcrbwja = ''kubecolor get clusterrolebinding     --all-namespaces -o json -w  '';
  kcgcrbywa = ''kubecolor get clusterrolebinding     --all-namespaces -o yaml -w  '';
  kcgcrbjwa = ''kubecolor get clusterrolebinding     --all-namespaces -o json -w  '';
  kcgcrbawy = ''kubecolor get clusterrolebinding     --all-namespaces -o yaml -w  '';
  kcgcrbawj = ''kubecolor get clusterrolebinding     --all-namespaces -o json -w  '';
  kcgcrbway = ''kubecolor get clusterrolebinding     --all-namespaces -o yaml -w  '';
  kcgcrbwaj = ''kubecolor get clusterrolebinding     --all-namespaces -o json -w  '';
  kcgcrbyaw = ''kubecolor get clusterrolebinding     --all-namespaces -o yaml -w  '';
  kcgcrbjaw = ''kubecolor get clusterrolebinding     --all-namespaces -o json -w  '';
  kcgcrbayw = ''kubecolor get clusterrolebinding     --all-namespaces -o yaml -w  '';
  kcgcrbajw = ''kubecolor get clusterrolebinding     --all-namespaces -o json -w  '';

  kcd       = ''kubecolor delete                                                  '';

  kcdp      = ''kubecolor delete pod                                              '';
  kcdpA     = ''kubecolor delete pod                                  --all       '';
  kcdpa     = ''kubecolor delete pod                 --all-namespaces             '';
  kcdpAa    = ''kubecolor delete pod                 --all-namespaces --all       '';
  kcdpaA    = ''kubecolor delete pod                 --all-namespaces --all       '';

  kcdd      = ''kubecolor delete deployment                                       '';
  kcddA     = ''kubecolor delete deployment                           --all       '';
  kcdda     = ''kubecolor delete deployment          --all-namespaces             '';
  kcddAa    = ''kubecolor delete deployment          --all-namespaces --all       '';
  kcddaA    = ''kubecolor delete deployment          --all-namespaces --all       '';

  kcds      = ''kubecolor delete service                                          '';
  kcdsA     = ''kubecolor delete service                              --all       '';
  kcdsa     = ''kubecolor delete service             --all-namespaces             '';
  kcdsAa    = ''kubecolor delete service             --all-namespaces --all       '';
  kcdsaA    = ''kubecolor delete service             --all-namespaces --all       '';

  kcdn      = ''kubecolor delete node                                             '';
  kcdnA     = ''kubecolor delete node                                 --all       '';
  kcdna     = ''kubecolor delete node                --all-namespaces             '';
  kcdnAa    = ''kubecolor delete node                --all-namespaces --all       '';
  kcdnaA    = ''kubecolor delete node                --all-namespaces --all       '';

  kcdi      = ''kubecolor delete ingress                                          '';
  kcdiA     = ''kubecolor delete ingress                              --all       '';
  kcdia     = ''kubecolor delete ingress             --all-namespaces             '';
  kcdiAa    = ''kubecolor delete ingress             --all-namespaces --all       '';
  kcdiaA    = ''kubecolor delete ingress             --all-namespaces --all       '';

  kcdr      = ''kubecolor delete role                                             '';
  kcdrA     = ''kubecolor delete role                                 --all       '';
  kcdra     = ''kubecolor delete role                --all-namespaces             '';
  kcdrAa    = ''kubecolor delete role                --all-namespaces --all       '';
  kcdraA    = ''kubecolor delete role                --all-namespaces --all       '';

  kcdrb     = ''kubecolor delete rolebinding                                      '';
  kcdrbA    = ''kubecolor delete rolebinding                          --all       '';
  kcdrba    = ''kubecolor delete rolebinding         --all-namespaces             '';
  kcdrbAa   = ''kubecolor delete rolebinding         --all-namespaces --all       '';
  kcdrbaA   = ''kubecolor delete rolebinding         --all-namespaces --all       '';

  kcdcr     = ''kubecolor delete clusterrole                                      '';
  kcdcrA    = ''kubecolor delete clusterrole                          --all       '';
  kcdcra    = ''kubecolor delete clusterrole         --all-namespaces             '';
  kcdcrAa   = ''kubecolor delete clusterrole         --all-namespaces --all       '';
  kcdcraA   = ''kubecolor delete clusterrole         --all-namespaces --all       '';

  kcdcrb    = ''kubecolor delete clusterrolebinding                               '';
  kcdcrbA   = ''kubecolor delete clusterrolebinding                   --all       '';
  kcdcrba   = ''kubecolor delete clusterrolebinding  --all-namespaces             '';
  kcdcrbAa  = ''kubecolor delete clusterrolebinding  --all-namespaces --all       '';
  kcdcrbaA  = ''kubecolor delete clusterrolebinding  --all-namespaces --all       '';

  kcs       = ''kubecolor decribe                                                 '';

  kcsp      = ''kubecolor decribe pod                                             '';
  kcspa     = ''kubecolor decribe pod                --all-namespaces             '';

  kcsd      = ''kubecolor decribe deployment                                      '';
  kcsda     = ''kubecolor decribe deployment         --all-namespaces             '';

  kcss      = ''kubecolor decribe service                                         '';
  kcssa     = ''kubecolor decribe service            --all-namespaces             '';

  kcsn      = ''kubecolor decribe node                                            '';
  kcsna     = ''kubecolor decribe node               --all-namespaces             '';

  kcsi      = ''kubecolor decribe ingress                                         '';
  kcsia     = ''kubecolor decribe ingress            --all-namespaces             '';

  kcsr      = ''kubecolor decribe role                                            '';
  kcsra     = ''kubecolor decribe role               --all-namespaces             '';

  kcsrb     = ''kubecolor decribe rolebinding                                     '';
  kcsrba    = ''kubecolor decribe rolebinding        --all-namespaces             '';

  kcscr     = ''kubecolor decribe clusterrole                                     '';
  kcscra    = ''kubecolor decribe clusterrole        --all-namespaces             '';

  kcscrb    = ''kubecolor decribe clusterrolebinding                              '';
  kcscrba   = ''kubecolor decribe clusterrolebinding --all-namespaces             '';

  kcx       = ''kubecolor exec                                                    '';
  kcxi      = ''kubecolor exec -it                                                '';

  kcl       = ''kubecolor logs                                                    '';
  kclf      = ''kubecolor logs -f                                                 '';

  kce       = ''kubecolor edit                                                    '';
  kcep      = ''kubecolor edit pod                                                '';
  kced      = ''kubecolor edit deployment                                         '';
  kces      = ''kubecolor edit service                                            '';
  kcen      = ''kubecolor edit node                                               '';
  kcei      = ''kubecolor edit ingress                                            '';
  kcer      = ''kubecolor edit role                                               '';
  kcerb     = ''kubecolor edit rolebinding                                        '';
  kcecr     = ''kubecolor edit clusterrole                                        '';
  kcecrb    = ''kubecolor edit clusterrolebinding                                 '';

  kca       = ''kubecolor apply                                                   '';

  kcp       = ''kubecolor port-forward                                            '';
  kcex      = ''kubecolor explain                                                 '';
}
