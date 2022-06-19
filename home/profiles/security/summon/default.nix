{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      summon          ### https://cyberark.github.io/summon/
    ];

    file.".local/bin/summonBrownie"       .source = ./dotLocal/summonBrownie       ;
    file.".local/bin/summonFlask"         .source = ./dotLocal/summonFlask         ;
    file.".local/bin/summonGopassProvider".source = ./dotLocal/summonGopassProvider;
    file.".local/bin/summonPulumi"        .source = ./dotLocal/summonPulumi        ;
  };
}
