{config, ...}:
{
  # networking.nameservers = [ "127.0.0.1" "8.8.8.8" "8.8.4.4" ];
  networking.nameservers = [ "127.0.0.1" ]; ### points to nixos.profiles.domain.server
}
