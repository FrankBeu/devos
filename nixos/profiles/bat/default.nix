{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      bat
    ] ++ ( with bat-extras; [
      batdiff
      batgrep
      batman
      batwatch
      prettybat
    ]);

    shellAliases = {
      man  = "batman";
      btdf = "batdiff";
      btgr = "batgrep";
      btwt = "batwatch";
      btpr = "prettybat";
    };
  };
  ### in hm
  ### TODO doc
  ### TODO configuration
  ### TODO colors
}
