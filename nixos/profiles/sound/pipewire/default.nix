{ pkgs, lib, config, ... }:
{
  sound.enable = lib.mkForce false;

  environment = {
    etc."/docLocal/content/system/pipewire.org".text   = (import ./doc.org.nix );

    systemPackages = with pkgs; [
      helvum                      ### https://gitlab.freedesktop.org/pipewire/helvum
    ];
  };

  hardware.pulseaudio.enable = lib.mkForce (!config.services.pipewire.enable);

  ### make pipewire realtime-capable
  security.rtkit.enable = true;

  services.pipewire     = {
    enable               = true;
    ### alsa is optional
    alsa.enable          = true;
    alsa.support32Bit    = lib.mkDefault true;
    ### needed for osu
    pulse.enable         = true;

    media-session.enable = false;
    wireplumber.enable   = true;

    jack.enable          = true;

    config.pipewire = {
      "context.properties" = {
        #"link.max-buffers"          = 64;
        "link.max-buffers"           = 16;            ### version < 3 clients can't handle more than this
        "log.level"                  = 2;             ### https://docs.pipewire.org/page_daemon.html
        "default.clock.rate"         = 48000;
        #"default.clock.quantum"     = 1024;
        "default.clock.quantum"      = 32;
        "default.clock.min-quantum"  = 32;
        # "default.clock.max-quantum"  = 32;
        "default.clock.max-quantum"  = 8192;
        "core.daemon"                = true;
        "core.name"                  = "pipewire-0";
      };
      "context.modules" = [
        {
          name = "libpipewire-module-rtkit";
          args = {
            "nice.level"   = -15;
            "rt.prio"      = 88;
            "rt.time.soft" = 200000;
            "rt.time.hard" = 200000;
          };
          flags = [ "ifexists" "nofail" ];
        }
        { name = "libpipewire-module-protocol-native"; }
        { name = "libpipewire-module-profiler"; }
        { name = "libpipewire-module-metadata"; }
        { name = "libpipewire-module-spa-device-factory"; }
        { name = "libpipewire-module-spa-node-factory"; }
        { name = "libpipewire-module-client-node"; }
        { name = "libpipewire-module-client-device"; }
        {
          name = "libpipewire-module-portal";
          flags = [ "ifexists" "nofail" ];
        }
        {
          name = "libpipewire-module-access";
          args = {};
        }
        { name = "libpipewire-module-adapter"; }
        { name = "libpipewire-module-link-factory"; }
        { name = "libpipewire-module-session-manager"; }
      ];
    };
  };
}
