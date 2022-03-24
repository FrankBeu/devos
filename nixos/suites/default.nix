{ profiles, ... }:
with profiles; rec
{
  base     = [ core                        ];
  docLocal = [      services.documentation ];
}
