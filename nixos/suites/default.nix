{ profiles, ... }:
with profiles; rec
{
  base     = [ core                                                                              ];
  docLocal = [ domain.local.domain domain.local.doc networking.nameserver services.documentation ];
}
