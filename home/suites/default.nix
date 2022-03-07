{ profiles, ...}:
with profiles; rec
{
  base = [ direnv git ];
}
