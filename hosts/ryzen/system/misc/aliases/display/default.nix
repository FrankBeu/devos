{
  environment = {
    shellAliases = {

        ### only AOC (single)

        "xa" =
          ''
            xrandr --auto && \
            xrandr \
            --output DisplayPort-0 --pos 0x0 --rotate left --primary \
            --output HDMI-A-0      --off'';


        ### only SAMSUNG (single)

        "xs" =
          ''
            xrandr --auto && \
            xrandr \
            --output HDMI-A-0      --pos 0x0 --rotate normal --primary \
            --output DisplayPort-0 --off'';


        ### SAMSUNG AOC (bed)

        "xb" =
          ''
            xrandr --auto && \
            xrandr \
            --output HDMI-A-0      --pos    0x0 --rotate normal \
            --output DisplayPort-0 --pos 1920x0 --rotate left   --primary'';


        ### AOC SAMSUNG (desk)

        "xd" =
          ''
            xrandr --auto && \
            xrandr \
            --output DisplayPort-0 --pos    0x0 --rotate left \
            --output HDMI-A-0      --pos 1080x0 --rotate normal --primary'';
    };
  };
}

### INFO
### Dimensions:
###
### |  SAMSUNG  |    AOC    |
### |-----------+-----------|
### | 1920x1080 | 1920x1080 |
###
###
### alignment, vertical:
### top:
###         0
### bottom:
###         S: 840
