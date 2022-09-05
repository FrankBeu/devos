{ inputs
, pkgs
, ...
}:
let
  domainTestServer = inputs.domainTestServer.defaultPackage.${pkgs.system};
in
{
  environment.systemPackages = with pkgs; [
    bind                       ###  dig
    ethtool
    gobuster
    ldns                       ###  drill, ...
    domainTestServer
  ];
}
