{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ncpamixer            ### https://github.com/fulhax/ncpamixer/tree/master/
    alsa-utils           ### alsamixer, aplay, ... https://github.com/alsa-project/alsa-utils/tree/788cfa71ea2461976923a895c948c4fa5328e8d6/alsamixer
  ];

  xdg.configFile."ncpamixer.conf".source = ./config/ncpamixer.conf;
  ### TODO color
  xdg.configFile."alsamixer.rc"  .source = ./config/alsamixer.rc;

  home.shellAliases = {
    am   = ''alsamixer'';  ### AlsaMixer
    pam  = ''ncpamixer'';  ### PulseAudioMixer
  };
}
