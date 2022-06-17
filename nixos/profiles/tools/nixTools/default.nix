{ channel, pkgs, ... }:
# { channel, pkgs, self, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      # nixos-option
    ];

    shellAliases = {
      no           = "nixos-option   ";                             ### NixosOptions
      nor          = "nixos-option -r";                             ### NixosOptionsRecursive
      # nixos-option = "nixos-option -I nixpkgs =${self}/lib/compat"; ### fix nixos-option BIG TODO why is self different
    };

  };

}
### TODO DOC
### DEPRECATED: programs.command-not-found.enable = true;
### nix-locate is used instead is used directly via nix-index-0.1.2/etc/profile.d/command-not-found.sh::command_not_found_handle
### ../../../../home/profiles/tools/nixTools/default.nix
### https://search.nixos.org/packages?channel=unstable&query=nixos-option
