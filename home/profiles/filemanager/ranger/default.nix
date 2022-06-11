{ nixosConfig, config, variables, ... }:
let
  inherit (config.home) username;
  group     = nixosConfig.users.users.${username}.group;
  bookmarks = (builtins.replaceStrings ["\n"] ["\\n"] (import ./ranger/state/bookmarks.nix { inherit username; }) ); ### TODO functionalize
in
{
  home.file.".config/ranger/scope.sh".source = ./ranger/config/scope.sh;
  ### bookmarks are created once and can then be modified.
  ### uppercase-bookmarks are constant
  ### on update: copy bookmarks to targetFile (replace username)
  ### TODO ranger: use state instead of share
  systemd.user.tmpfiles.rules = [
    "f /home/${username}/.local/share/ranger/bookmarks 644 ${username} ${group} - ${bookmarks}"
  ];
}
### TODO DOC
