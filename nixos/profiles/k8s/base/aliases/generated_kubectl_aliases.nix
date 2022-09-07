{
  k        = ''kubectl                                                          '';

  kg       = ''kubectl get                                                      '';

  kgp      = ''kubectl get pod                                                  '';
  kgpw     = ''kubectl get pod                                              -w  '';
  kgpy     = ''kubectl get pod                                      -o yaml     '';
  kgpj     = ''kubectl get pod                                      -o json     '';
  kgpwy    = ''kubectl get pod                                      -o yaml -w  '';
  kgpwj    = ''kubectl get pod                                      -o json -w  '';
  kgpyw    = ''kubectl get pod                                      -o yaml -w  '';
  kgpjw    = ''kubectl get pod                                      -o json -w  '';
  kgpa     = ''kubectl get pod                     --all-namespaces             '';
  kgpwa    = ''kubectl get pod                     --all-namespaces         -w  '';
  kgpaw    = ''kubectl get pod                     --all-namespaces         -w  '';
  kgpya    = ''kubectl get pod                     --all-namespaces -o yaml     '';
  kgpja    = ''kubectl get pod                     --all-namespaces -o json     '';
  kgpay    = ''kubectl get pod                     --all-namespaces -o yaml     '';
  kgpaj    = ''kubectl get pod                     --all-namespaces -o json     '';
  kgpwya   = ''kubectl get pod                     --all-namespaces -o yaml -w  '';
  kgpwja   = ''kubectl get pod                     --all-namespaces -o json -w  '';
  kgpywa   = ''kubectl get pod                     --all-namespaces -o yaml -w  '';
  kgpjwa   = ''kubectl get pod                     --all-namespaces -o json -w  '';
  kgpawy   = ''kubectl get pod                     --all-namespaces -o yaml -w  '';
  kgpawj   = ''kubectl get pod                     --all-namespaces -o json -w  '';
  kgpway   = ''kubectl get pod                     --all-namespaces -o yaml -w  '';
  kgpwaj   = ''kubectl get pod                     --all-namespaces -o json -w  '';
  kgpyaw   = ''kubectl get pod                     --all-namespaces -o yaml -w  '';
  kgpjaw   = ''kubectl get pod                     --all-namespaces -o json -w  '';
  kgpayw   = ''kubectl get pod                     --all-namespaces -o yaml -w  '';
  kgpajw   = ''kubectl get pod                     --all-namespaces -o json -w  '';

  kgd      = ''kubectl get deployment                                           '';
  kgdw     = ''kubectl get deployment                                       -w  '';
  kgdy     = ''kubectl get deployment                               -o yaml     '';
  kgdj     = ''kubectl get deployment                               -o json     '';
  kgdwy    = ''kubectl get deployment                               -o yaml -w  '';
  kgdwj    = ''kubectl get deployment                               -o json -w  '';
  kgdyw    = ''kubectl get deployment                               -o yaml -w  '';
  kgdjw    = ''kubectl get deployment                               -o json -w  '';
  kgda     = ''kubectl get deployment              --all-namespaces             '';
  kgdwa    = ''kubectl get deployment              --all-namespaces         -w  '';
  kgdaw    = ''kubectl get deployment              --all-namespaces         -w  '';
  kgdya    = ''kubectl get deployment              --all-namespaces -o yaml     '';
  kgdja    = ''kubectl get deployment              --all-namespaces -o json     '';
  kgday    = ''kubectl get deployment              --all-namespaces -o yaml     '';
  kgdaj    = ''kubectl get deployment              --all-namespaces -o json     '';
  kgdwya   = ''kubectl get deployment              --all-namespaces -o yaml -w  '';
  kgdwja   = ''kubectl get deployment              --all-namespaces -o json -w  '';
  kgdywa   = ''kubectl get deployment              --all-namespaces -o yaml -w  '';
  kgdjwa   = ''kubectl get deployment              --all-namespaces -o json -w  '';
  kgdawy   = ''kubectl get deployment              --all-namespaces -o yaml -w  '';
  kgdawj   = ''kubectl get deployment              --all-namespaces -o json -w  '';
  kgdway   = ''kubectl get deployment              --all-namespaces -o yaml -w  '';
  kgdwaj   = ''kubectl get deployment              --all-namespaces -o json -w  '';
  kgdyaw   = ''kubectl get deployment              --all-namespaces -o yaml -w  '';
  kgdjaw   = ''kubectl get deployment              --all-namespaces -o json -w  '';
  kgdayw   = ''kubectl get deployment              --all-namespaces -o yaml -w  '';
  kgdajw   = ''kubectl get deployment              --all-namespaces -o json -w  '';

  kgs      = ''kubectl get service                                              '';
  kgsw     = ''kubectl get service                                          -w  '';
  kgsy     = ''kubectl get service                                  -o yaml     '';
  kgsj     = ''kubectl get service                                  -o json     '';
  kgswy    = ''kubectl get service                                  -o yaml -w  '';
  kgswj    = ''kubectl get service                                  -o json -w  '';
  kgsyw    = ''kubectl get service                                  -o yaml -w  '';
  kgsjw    = ''kubectl get service                                  -o json -w  '';
  kgsa     = ''kubectl get service                 --all-namespaces             '';
  kgswa    = ''kubectl get service                 --all-namespaces         -w  '';
  kgsaw    = ''kubectl get service                 --all-namespaces         -w  '';
  kgsya    = ''kubectl get service                 --all-namespaces -o yaml     '';
  kgsja    = ''kubectl get service                 --all-namespaces -o json     '';
  kgsay    = ''kubectl get service                 --all-namespaces -o yaml     '';
  kgsaj    = ''kubectl get service                 --all-namespaces -o json     '';
  kgswya   = ''kubectl get service                 --all-namespaces -o yaml -w  '';
  kgswja   = ''kubectl get service                 --all-namespaces -o json -w  '';
  kgsywa   = ''kubectl get service                 --all-namespaces -o yaml -w  '';
  kgsjwa   = ''kubectl get service                 --all-namespaces -o json -w  '';
  kgsawy   = ''kubectl get service                 --all-namespaces -o yaml -w  '';
  kgsawj   = ''kubectl get service                 --all-namespaces -o json -w  '';
  kgsway   = ''kubectl get service                 --all-namespaces -o yaml -w  '';
  kgswaj   = ''kubectl get service                 --all-namespaces -o json -w  '';
  kgsyaw   = ''kubectl get service                 --all-namespaces -o yaml -w  '';
  kgsjaw   = ''kubectl get service                 --all-namespaces -o json -w  '';
  kgsayw   = ''kubectl get service                 --all-namespaces -o yaml -w  '';
  kgsajw   = ''kubectl get service                 --all-namespaces -o json -w  '';

  kgn      = ''kubectl get node                                                 '';
  kgnw     = ''kubectl get node                                             -w  '';
  kgny     = ''kubectl get node                                     -o yaml     '';
  kgnj     = ''kubectl get node                                     -o json     '';
  kgnwy    = ''kubectl get node                                     -o yaml -w  '';
  kgnwj    = ''kubectl get node                                     -o json -w  '';
  kgnyw    = ''kubectl get node                                     -o yaml -w  '';
  kgnjw    = ''kubectl get node                                     -o json -w  '';
  kgna     = ''kubectl get node                    --all-namespaces             '';
  kgnwa    = ''kubectl get node                    --all-namespaces         -w  '';
  kgnaw    = ''kubectl get node                    --all-namespaces         -w  '';
  kgnya    = ''kubectl get node                    --all-namespaces -o yaml     '';
  kgnja    = ''kubectl get node                    --all-namespaces -o json     '';
  kgnay    = ''kubectl get node                    --all-namespaces -o yaml     '';
  kgnaj    = ''kubectl get node                    --all-namespaces -o json     '';
  kgnwya   = ''kubectl get node                    --all-namespaces -o yaml -w  '';
  kgnwja   = ''kubectl get node                    --all-namespaces -o json -w  '';
  kgnywa   = ''kubectl get node                    --all-namespaces -o yaml -w  '';
  kgnjwa   = ''kubectl get node                    --all-namespaces -o json -w  '';
  kgnawy   = ''kubectl get node                    --all-namespaces -o yaml -w  '';
  kgnawj   = ''kubectl get node                    --all-namespaces -o json -w  '';
  kgnway   = ''kubectl get node                    --all-namespaces -o yaml -w  '';
  kgnwaj   = ''kubectl get node                    --all-namespaces -o json -w  '';
  kgnyaw   = ''kubectl get node                    --all-namespaces -o yaml -w  '';
  kgnjaw   = ''kubectl get node                    --all-namespaces -o json -w  '';
  kgnayw   = ''kubectl get node                    --all-namespaces -o yaml -w  '';
  kgnajw   = ''kubectl get node                    --all-namespaces -o json -w  '';

  kgi      = ''kubectl get ingress                                              '';
  kgiw     = ''kubectl get ingress                                          -w  '';
  kgiy     = ''kubectl get ingress                                  -o yaml     '';
  kgij     = ''kubectl get ingress                                  -o json     '';
  kgiwy    = ''kubectl get ingress                                  -o yaml -w  '';
  kgiwj    = ''kubectl get ingress                                  -o json -w  '';
  kgiyw    = ''kubectl get ingress                                  -o yaml -w  '';
  kgijw    = ''kubectl get ingress                                  -o json -w  '';
  kgia     = ''kubectl get ingress                 --all-namespaces             '';
  kgiwa    = ''kubectl get ingress                 --all-namespaces         -w  '';
  kgiaw    = ''kubectl get ingress                 --all-namespaces         -w  '';
  kgiya    = ''kubectl get ingress                 --all-namespaces -o yaml     '';
  kgija    = ''kubectl get ingress                 --all-namespaces -o json     '';
  kgiay    = ''kubectl get ingress                 --all-namespaces -o yaml     '';
  kgiaj    = ''kubectl get ingress                 --all-namespaces -o json     '';
  kgiwya   = ''kubectl get ingress                 --all-namespaces -o yaml -w  '';
  kgiwja   = ''kubectl get ingress                 --all-namespaces -o json -w  '';
  kgiywa   = ''kubectl get ingress                 --all-namespaces -o yaml -w  '';
  kgijwa   = ''kubectl get ingress                 --all-namespaces -o json -w  '';
  kgiawy   = ''kubectl get ingress                 --all-namespaces -o yaml -w  '';
  kgiawj   = ''kubectl get ingress                 --all-namespaces -o json -w  '';
  kgiway   = ''kubectl get ingress                 --all-namespaces -o yaml -w  '';
  kgiwaj   = ''kubectl get ingress                 --all-namespaces -o json -w  '';
  kgiyaw   = ''kubectl get ingress                 --all-namespaces -o yaml -w  '';
  kgijaw   = ''kubectl get ingress                 --all-namespaces -o json -w  '';
  kgiayw   = ''kubectl get ingress                 --all-namespaces -o yaml -w  '';
  kgiajw   = ''kubectl get ingress                 --all-namespaces -o json -w  '';

  kgr      = ''kubectl get role                                                 '';
  kgrw     = ''kubectl get role                                             -w  '';
  kgry     = ''kubectl get role                                     -o yaml     '';
  kgrj     = ''kubectl get role                                     -o json     '';
  kgrwy    = ''kubectl get role                                     -o yaml -w  '';
  kgrwj    = ''kubectl get role                                     -o json -w  '';
  kgryw    = ''kubectl get role                                     -o yaml -w  '';
  kgrjw    = ''kubectl get role                                     -o json -w  '';
  kgra     = ''kubectl get role                    --all-namespaces             '';
  kgrwa    = ''kubectl get role                    --all-namespaces         -w  '';
  kgraw    = ''kubectl get role                    --all-namespaces         -w  '';
  kgrya    = ''kubectl get role                    --all-namespaces -o yaml     '';
  kgrja    = ''kubectl get role                    --all-namespaces -o json     '';
  kgray    = ''kubectl get role                    --all-namespaces -o yaml     '';
  kgraj    = ''kubectl get role                    --all-namespaces -o json     '';
  kgrwya   = ''kubectl get role                    --all-namespaces -o yaml -w  '';
  kgrwja   = ''kubectl get role                    --all-namespaces -o json -w  '';
  kgrywa   = ''kubectl get role                    --all-namespaces -o yaml -w  '';
  kgrjwa   = ''kubectl get role                    --all-namespaces -o json -w  '';
  kgrawy   = ''kubectl get role                    --all-namespaces -o yaml -w  '';
  kgrawj   = ''kubectl get role                    --all-namespaces -o json -w  '';
  kgrway   = ''kubectl get role                    --all-namespaces -o yaml -w  '';
  kgrwaj   = ''kubectl get role                    --all-namespaces -o json -w  '';
  kgryaw   = ''kubectl get role                    --all-namespaces -o yaml -w  '';
  kgrjaw   = ''kubectl get role                    --all-namespaces -o json -w  '';
  kgrayw   = ''kubectl get role                    --all-namespaces -o yaml -w  '';
  kgrajw   = ''kubectl get role                    --all-namespaces -o json -w  '';

  kgrb     = ''kubectl get rolebinding                                          '';
  kgrbw    = ''kubectl get rolebinding                                      -w  '';
  kgrby    = ''kubectl get rolebinding                              -o yaml     '';
  kgrbj    = ''kubectl get rolebinding                              -o json     '';
  kgrbwy   = ''kubectl get rolebinding                              -o yaml -w  '';
  kgrbwj   = ''kubectl get rolebinding                              -o json -w  '';
  kgrbyw   = ''kubectl get rolebinding                              -o yaml -w  '';
  kgrbjw   = ''kubectl get rolebinding                              -o json -w  '';
  kgrba    = ''kubectl get rolebinding             --all-namespaces             '';
  kgrbwa   = ''kubectl get rolebinding             --all-namespaces         -w  '';
  kgrbaw   = ''kubectl get rolebinding             --all-namespaces         -w  '';
  kgrbya   = ''kubectl get rolebinding             --all-namespaces -o yaml     '';
  kgrbja   = ''kubectl get rolebinding             --all-namespaces -o json     '';
  kgrbay   = ''kubectl get rolebinding             --all-namespaces -o yaml     '';
  kgrbaj   = ''kubectl get rolebinding             --all-namespaces -o json     '';
  kgrbwya  = ''kubectl get rolebinding             --all-namespaces -o yaml -w  '';
  kgrbwja  = ''kubectl get rolebinding             --all-namespaces -o json -w  '';
  kgrbywa  = ''kubectl get rolebinding             --all-namespaces -o yaml -w  '';
  kgrbjwa  = ''kubectl get rolebinding             --all-namespaces -o json -w  '';
  kgrbawy  = ''kubectl get rolebinding             --all-namespaces -o yaml -w  '';
  kgrbawj  = ''kubectl get rolebinding             --all-namespaces -o json -w  '';
  kgrbway  = ''kubectl get rolebinding             --all-namespaces -o yaml -w  '';
  kgrbwaj  = ''kubectl get rolebinding             --all-namespaces -o json -w  '';
  kgrbyaw  = ''kubectl get rolebinding             --all-namespaces -o yaml -w  '';
  kgrbjaw  = ''kubectl get rolebinding             --all-namespaces -o json -w  '';
  kgrbayw  = ''kubectl get rolebinding             --all-namespaces -o yaml -w  '';
  kgrbajw  = ''kubectl get rolebinding             --all-namespaces -o json -w  '';

  kgcr     = ''kubectl get clusterrole                                          '';
  kgcrw    = ''kubectl get clusterrole                                      -w  '';
  kgcry    = ''kubectl get clusterrole                              -o yaml     '';
  kgcrj    = ''kubectl get clusterrole                              -o json     '';
  kgcrwy   = ''kubectl get clusterrole                              -o yaml -w  '';
  kgcrwj   = ''kubectl get clusterrole                              -o json -w  '';
  kgcryw   = ''kubectl get clusterrole                              -o yaml -w  '';
  kgcrjw   = ''kubectl get clusterrole                              -o json -w  '';
  kgcra    = ''kubectl get clusterrole             --all-namespaces             '';
  kgcrwa   = ''kubectl get clusterrole             --all-namespaces         -w  '';
  kgcraw   = ''kubectl get clusterrole             --all-namespaces         -w  '';
  kgcrya   = ''kubectl get clusterrole             --all-namespaces -o yaml     '';
  kgcrja   = ''kubectl get clusterrole             --all-namespaces -o json     '';
  kgcray   = ''kubectl get clusterrole             --all-namespaces -o yaml     '';
  kgcraj   = ''kubectl get clusterrole             --all-namespaces -o json     '';
  kgcrwya  = ''kubectl get clusterrole             --all-namespaces -o yaml -w  '';
  kgcrwja  = ''kubectl get clusterrole             --all-namespaces -o json -w  '';
  kgcrywa  = ''kubectl get clusterrole             --all-namespaces -o yaml -w  '';
  kgcrjwa  = ''kubectl get clusterrole             --all-namespaces -o json -w  '';
  kgcrawy  = ''kubectl get clusterrole             --all-namespaces -o yaml -w  '';
  kgcrawj  = ''kubectl get clusterrole             --all-namespaces -o json -w  '';
  kgcrway  = ''kubectl get clusterrole             --all-namespaces -o yaml -w  '';
  kgcrwaj  = ''kubectl get clusterrole             --all-namespaces -o json -w  '';
  kgcryaw  = ''kubectl get clusterrole             --all-namespaces -o yaml -w  '';
  kgcrjaw  = ''kubectl get clusterrole             --all-namespaces -o json -w  '';
  kgcrayw  = ''kubectl get clusterrole             --all-namespaces -o yaml -w  '';
  kgcrajw  = ''kubectl get clusterrole             --all-namespaces -o json -w  '';

  kgcrb    = ''kubectl get clusterrolebinding                                   '';
  kgcrbw   = ''kubectl get clusterrolebinding                               -w  '';
  kgcrby   = ''kubectl get clusterrolebinding                       -o yaml     '';
  kgcrbj   = ''kubectl get clusterrolebinding                       -o json     '';
  kgcrbwy  = ''kubectl get clusterrolebinding                       -o yaml -w  '';
  kgcrbwj  = ''kubectl get clusterrolebinding                       -o json -w  '';
  kgcrbyw  = ''kubectl get clusterrolebinding                       -o yaml -w  '';
  kgcrbjw  = ''kubectl get clusterrolebinding                       -o json -w  '';
  kgcrba   = ''kubectl get clusterrolebinding      --all-namespaces             '';
  kgcrbwa  = ''kubectl get clusterrolebinding      --all-namespaces         -w  '';
  kgcrbaw  = ''kubectl get clusterrolebinding      --all-namespaces         -w  '';
  kgcrbya  = ''kubectl get clusterrolebinding      --all-namespaces -o yaml     '';
  kgcrbja  = ''kubectl get clusterrolebinding      --all-namespaces -o json     '';
  kgcrbay  = ''kubectl get clusterrolebinding      --all-namespaces -o yaml     '';
  kgcrbaj  = ''kubectl get clusterrolebinding      --all-namespaces -o json     '';
  kgcrbwya = ''kubectl get clusterrolebinding      --all-namespaces -o yaml -w  '';
  kgcrbwja = ''kubectl get clusterrolebinding      --all-namespaces -o json -w  '';
  kgcrbywa = ''kubectl get clusterrolebinding      --all-namespaces -o yaml -w  '';
  kgcrbjwa = ''kubectl get clusterrolebinding      --all-namespaces -o json -w  '';
  kgcrbawy = ''kubectl get clusterrolebinding      --all-namespaces -o yaml -w  '';
  kgcrbawj = ''kubectl get clusterrolebinding      --all-namespaces -o json -w  '';
  kgcrbway = ''kubectl get clusterrolebinding      --all-namespaces -o yaml -w  '';
  kgcrbwaj = ''kubectl get clusterrolebinding      --all-namespaces -o json -w  '';
  kgcrbyaw = ''kubectl get clusterrolebinding      --all-namespaces -o yaml -w  '';
  kgcrbjaw = ''kubectl get clusterrolebinding      --all-namespaces -o json -w  '';
  kgcrbayw = ''kubectl get clusterrolebinding      --all-namespaces -o yaml -w  '';
  kgcrbajw = ''kubectl get clusterrolebinding      --all-namespaces -o json -w  '';

  kd       = ''kubectl delete                                                   '';

  kdp      = ''kubectl delete pod                                               '';
  kdpA     = ''kubectl delete pod                                   --all       '';
  kdpa     = ''kubectl delete pod                  --all-namespaces             '';
  kdpAa    = ''kubectl delete pod                  --all-namespaces --all       '';
  kdpaA    = ''kubectl delete pod                  --all-namespaces --all       '';

  kdd      = ''kubectl delete deployment                                        '';
  kddA     = ''kubectl delete deployment                            --all       '';
  kdda     = ''kubectl delete deployment           --all-namespaces             '';
  kddAa    = ''kubectl delete deployment           --all-namespaces --all       '';
  kddaA    = ''kubectl delete deployment           --all-namespaces --all       '';

  kds      = ''kubectl delete service                                           '';
  kdsA     = ''kubectl delete service                               --all       '';
  kdsa     = ''kubectl delete service              --all-namespaces             '';
  kdsAa    = ''kubectl delete service              --all-namespaces --all       '';
  kdsaA    = ''kubectl delete service              --all-namespaces --all       '';

  kdn      = ''kubectl delete node                                              '';
  kdnA     = ''kubectl delete node                                  --all       '';
  kdna     = ''kubectl delete node                 --all-namespaces             '';
  kdnAa    = ''kubectl delete node                 --all-namespaces --all       '';
  kdnaA    = ''kubectl delete node                 --all-namespaces --all       '';

  kdi      = ''kubectl delete ingress                                           '';
  kdiA     = ''kubectl delete ingress                               --all       '';
  kdia     = ''kubectl delete ingress              --all-namespaces             '';
  kdiAa    = ''kubectl delete ingress              --all-namespaces --all       '';
  kdiaA    = ''kubectl delete ingress              --all-namespaces --all       '';

  kdr      = ''kubectl delete role                                              '';
  kdrA     = ''kubectl delete role                                  --all       '';
  kdra     = ''kubectl delete role                 --all-namespaces             '';
  kdrAa    = ''kubectl delete role                 --all-namespaces --all       '';
  kdraA    = ''kubectl delete role                 --all-namespaces --all       '';

  kdrb     = ''kubectl delete rolebinding                                       '';
  kdrbA    = ''kubectl delete rolebinding                           --all       '';
  kdrba    = ''kubectl delete rolebinding          --all-namespaces             '';
  kdrbAa   = ''kubectl delete rolebinding          --all-namespaces --all       '';
  kdrbaA   = ''kubectl delete rolebinding          --all-namespaces --all       '';

  kdcr     = ''kubectl delete clusterrole                                       '';
  kdcrA    = ''kubectl delete clusterrole                           --all       '';
  kdcra    = ''kubectl delete clusterrole          --all-namespaces             '';
  kdcrAa   = ''kubectl delete clusterrole          --all-namespaces --all       '';
  kdcraA   = ''kubectl delete clusterrole          --all-namespaces --all       '';

  kdcrb    = ''kubectl delete clusterrolebinding                                '';
  kdcrbA   = ''kubectl delete clusterrolebinding                    --all       '';
  kdcrba   = ''kubectl delete clusterrolebinding   --all-namespaces             '';
  kdcrbAa  = ''kubectl delete clusterrolebinding   --all-namespaces --all       '';
  kdcrbaA  = ''kubectl delete clusterrolebinding   --all-namespaces --all       '';

  ks       = ''kubectl describe                                                 '';

  ksp      = ''kubectl describe pod                                             '';
  kspa     = ''kubectl describe pod                --all-namespaces             '';

  ksd      = ''kubectl describe deployment                                      '';
  ksda     = ''kubectl describe deployment         --all-namespaces             '';

  kss      = ''kubectl describe service                                         '';
  kssa     = ''kubectl describe service            --all-namespaces             '';

  ksn      = ''kubectl describe node                                            '';
  ksna     = ''kubectl describe node               --all-namespaces             '';

  ksi      = ''kubectl describe ingress                                         '';
  ksia     = ''kubectl describe ingress            --all-namespaces             '';

  ksr      = ''kubectl describe role                                            '';
  ksra     = ''kubectl describe role               --all-namespaces             '';

  ksrb     = ''kubectl describe rolebinding                                     '';
  ksrba    = ''kubectl describe rolebinding        --all-namespaces             '';

  kscr     = ''kubectl describe clusterrole                                     '';
  kscra    = ''kubectl describe clusterrole        --all-namespaces             '';

  kscrb    = ''kubectl describe clusterrolebinding                              '';
  kscrba   = ''kubectl describe clusterrolebinding --all-namespaces             '';

  kx       = ''kubectl exec                                                     '';
  kxi      = ''kubectl exec -it                                                 '';

  kl       = ''kubectl logs                                                     '';
  klf      = ''kubectl logs -f                                                  '';

  ke       = ''kubectl edit                                                     '';
  kep      = ''kubectl edit pod                                                 '';
  ked      = ''kubectl edit deployment                                          '';
  kes      = ''kubectl edit service                                             '';
  ken      = ''kubectl edit node                                                '';
  kei      = ''kubectl edit ingress                                             '';
  ker      = ''kubectl edit role                                                '';
  kerb     = ''kubectl edit rolebinding                                         '';
  kecr     = ''kubectl edit clusterrole                                         '';
  kecrb    = ''kubectl edit clusterrolebinding                                  '';

  ka       = ''kubectl apply                                                    '';

  kp       = ''kubectl port-forward                                             '';
  kex      = ''kubectl explain                                                  '';
}
