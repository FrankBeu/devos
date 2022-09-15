{config, lib, pkgs, variables, ...}:
let
  inherit (config.home) username;
in
{
  home = {
    packages = with pkgs; [
      obs-studio      ### https://obsproject.com/
    ];
    file.".manualActions/manualActions.org".text = pkgs.lib.mkDefault( pkgs.lib.mkOrder 150 ''
      ** obs
      *** TODO rename profile via =Menubar=
      Profile > Rename "Untitled" -> "${username}"
      *** TODO set storagePath via =Controls=
      Settings > Output > Recording > Recording Path:
      =home/${username}/VIDEO/OBS='');
  };
}
