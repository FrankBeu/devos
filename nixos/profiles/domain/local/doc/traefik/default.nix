### TODO extract to variables or create module
let port = 41503; in
{
  environment.etc."traefik/conf/docDotLocal.toml".text = import ./docDotLocal.toml.nix { inherit port; };
}
