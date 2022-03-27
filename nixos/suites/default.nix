{ profiles, ... }:
with profiles; rec
{
  base     = [ core                                                                      ];
  docLocal = [ domain.local domain.docLocal networking.nameserver services.documentation ];
}
