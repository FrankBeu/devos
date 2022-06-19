{ config, nixosConfig, pkgs, ... }:
{
  home.packages = with pkgs; [
    age       ### https://github.com/FiloSottile/age
  ];

  home.shellAliases = {
    aga   = ''age -a                                        '';  ### Age-Ascii
    agd   = ''age    -d                                     '';  ### Age-Decrypt
    agi   = ''age       -i       ~/.config/age/key.sec      '';  ### Age-Identity
    agid  = ''age    -d -i       ~/.config/age/key.sec      '';  ### Age-Identity-Decrypt
    agp   = ''age          -p                               '';  ### Age-Password
    agr   = ''age             -R ~/.config/age/key.pub      '';  ### Age-Encrypt
    agsp  = ''bat                ~/.config/age/key.pub      '';  ### Age-Show-identity-Public
    agss  = ''age    -d          ~/.config/age/key.sec | bat'';  ### Age-Show-identity-Secret
  };

  home.file.".docLocal/content/homemanager/security.org".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
    ${(import ./age.org { inherit config nixosConfig; })}
  '');
}
