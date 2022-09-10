{ config
, lib
, nixosConfig
, pkgs
, ... }:
let
  inherit (config.home)                         username;
  inherit (nixosConfig.users.users.${username}) group;

  actionpath  = ".config/actionButton";
  keybindings = {
    mod         = "SUPER" ;### TODO get from module keybinding::i3.mod
    modeTrigger = "i"     ;
  };

  docVars = {
    inherit keybindings actionpath;
  };

  ### TODO globalize into lib (mind result: quoted or unquoted and -t or -n. cf.: ../security/gopass/default.nix:32:11)
  editor = if nixosConfig.services.emacs.enable
  then "emacsclient -nc -a \"\""
  else "vim";

in
{
  xdg.configFile."i3/config".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
    ${(import ./i3/additional.nix { inherit editor keybindings; })}
  '' );

  systemd.user.tmpfiles.rules =
    let
      template          = ''\x21\x23/usr/bin/env\x20zsh\x0a'';### systemd-escape  '!#/usr/bin/env zsh\n'  ### substitute - /
      ### all filenames which have to be created
      scriptBaseNames   = [
        "y" "u" "i"     "o"      "p"
        "h" "j" "k"     "l"      "semicolon"
        "n" "m" "comma" "period" "slash"
      ];
      ### create a list of sets containing the     filename, ...                      which will be mapped to the systemd-tmpfile-statement
      fileNamesWithArgs = map (filename: { inherit filename username group actionpath; }) scriptBaseNames;
      # docDir = config.xdg.userDirs.documents; ### TODO xdg: convert to absolute paths after allTests
    in
    [
      "d  /home/${username}/DOCUMENTS/PROJECTS                      755 ${username} ${group} - -"
      "d  /home/${username}/DOCUMENTS/PROJECTS/actionButton         755 ${username} ${group} - -"

      "d  /home/${username}/${actionpath}                           755 ${username} ${group} - -"
      "d  /home/${username}/${actionpath}/TEMPLATES                 755 ${username} ${group} - -"
      "L+ /home/${username}/${actionpath}/FUNDUS                    -     -           -      - /home/${username}/DOCUMENTS/PROJECTS/actionButton"
    ] ++
    (map (x: with x;
      "f+ /home/${username}/${actionpath}/TEMPLATES/${filename}.zsh 644 ${username} ${group} - ${template}"
    ) fileNamesWithArgs);

    home = {
      file."${actionpath}/EXAMPLES/" = {
        source    = ./EXAMPLES;
        recursive = true;
      };
      file.".docLocal/content/homemanager/actionButton.org".text   = (import ./doc.org.nix  { inherit docVars; });
    };
}
