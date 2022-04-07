###
##
# * xserver, ibus
#
{pkgs, lib, ...}:
{
  ###
  ##
  # ** XOR
  #
#  i18n.inputMethod = {
#    enabled = "ibus";
#    ibus.engines = with pkgs.ibus-engines; [
#      # anthy
#      table
#      table-others
#    ];
#  };

  i18n.inputMethod = {
    enabled = "fcitx";  ### Free Chinese Input Toy for X
    fcitx.engines = with pkgs.fcitx-engines; [
      mozc
      # table-other
      rime                                      ### https://wiki.archlinux.org/title/Rime
      m17n
    ];
  };

}

###
##
# ** INFO
#
# https://confluence.jaytaala.com/display/TKB/Japanese+input+with+i3+and+Arch+based+distros
# https://www.reddit.com/r/i3wm/comments/fr6vrw/solved_fcitx_conflict_with_x11_keyboard_layout/
# https://en.wikipedia.org/wiki/Boshiamy_method
# https://blogs.gnome.org/happyaron/2011/01/15/linux-input-method-brief-summary/

# /etc/set-environment
# GTK_IM_MODULE=fcitx
# QT_IM_MODULE=fcitx
# XMODIFIERS=@im=fcitx
#
# fcitx-diagnose
# fcitx-configtool
