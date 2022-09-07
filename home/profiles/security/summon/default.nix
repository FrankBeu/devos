{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      summon          ### https://cyberark.github.io/summon/
      gopass-summon-provider
    ];

    file.".local/bin/summonBrownie".source = ./dotLocal/summonBrownie;
    file.".local/bin/summonFlask"  .source = ./dotLocal/summonFlask  ;
    file.".local/bin/summonPulumi" .source = ./dotLocal/summonPulumi ;

    shellAliases = {
      smn  = ''summon '';                                                                      ### SUMmoN
      smng = ''summon --provider ${pkgs.gopass-summon-provider}/bin/gopass-summon-provider'';  ### SUMmoN-Gopass-provider
    };
  };
}
