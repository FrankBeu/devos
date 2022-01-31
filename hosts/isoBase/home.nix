{ inputs
, mainUser
, profiles
, ...
}:
{
  home-manager.users.${mainUser} = { inputs, profiles, suites, ... }: {
    imports = [
      profiles.filemanager.ranger
      profiles.test

      inputs.nix-colors.homeManagerModule
    ];

    # colorscheme = inputs.nix-colors.colorSchemes.nord;
    # colorscheme = inputs.nix-colors.colorSchemes.${theme};
    # config.colorscheme = inputs.nix-colors.colorSchemes.dracula;
    colorscheme = inputs.nix-colors.colorSchemes.horizon-dark;
    # colorscheme = inputs.nix-colors.colorSchemes.tokyonight;

  };
}
