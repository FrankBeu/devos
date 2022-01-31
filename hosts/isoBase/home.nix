{ profiles, mainUser, ... }:
{
  home-manager.users.${mainUser} = { suites, profiles, ... }: {
    imports = [
      profiles.filemanager.ranger
    ];
  };
}
