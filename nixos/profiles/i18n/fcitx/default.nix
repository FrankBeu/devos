{pkgs, lib, ...}:
{
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk            ### support for GTK-based programs
      libsForQt5.fcitx5-qt  ### support for  QT-based programs
      fcitx5-mozc           ### japanese
      fcitx5-chinese-addons ### wubi
      fcitx5-table-extra    ### Boshiamy
    ];
  };

  environment.systemPackages = with pkgs; [
    fcitx5-configtool
  ];
}
