{
  services.xserver = {

    ### Enable the X11 windowing system.
    enable = true;

    ### Enable the GNOME 3 Desktop Environment.
    desktopManager.gnome.enable = true;

    ### Configure keymap in X11
    # layout     = "us";
    # xkbOptions = "eurosign:e";
    # layout     = "fr";
    # xkbVariant = "bepo";

    ### Enable touchpad support (enabled default in most desktopManager).
    # libinput.enable = true;
  };
}
