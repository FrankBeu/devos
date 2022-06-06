{
  environment = {
    shellAliases = {

        ### MAC SAMSUNG (desktop)

        "xd" =
          ''
            xrandr --auto && \
            xrandr \
            --output DP-1 --pos    0x0   --rotate normal \
            --output DP-2 --pos 2560x0   --rotate normal --primary \
            --output DP-3 --off'';


        ### SAMSUNG MAC (bed)

        "xb" =
          ''
            xrandr --auto && \
            xrandr \
            --output DP-2 --pos    0x340 --rotate normal --primary \
            --output DP-1 --pos 1920x0   --rotate normal \
            --output DP-3 --off'';


        ### only MAC (single)

        "xm" =
          ''
            xrandr --auto && \
            xrandr \
            --output DP-1 --pos 0x0 --rotate normal --primary \
            --output DP-2 --off \
            --output DP-3 --off'';


        ### only SAMSUNG (single)

        "xs" =
          ''
            xrandr --auto && \
            xrandr \
            --output DP-2 --auto --primary \
            --output DP-1 --off \
            --output DP-3 --off'';


        ### only AOC (single)

        "xa" =
          ''
            xrandr --auto && \
            xrandr \
            --output DP-3 --pos 0x0 --rotate left --primary \
            --output DP-1 --off \
            --output DP-2 --off'';


        ### AOC SAMSUNG MAC (all3)

        "x3" =
          ''
            xrandr --auto && \
            xrandr \
            --output DP-3 --pos    0x0   --rotate left \
            --output DP-2 --pos 1080x240 --rotate normal --primary \
            --output DP-1 --pos 3000x240 --rotate normal'';


        ### AOC MAC SAMSUNG (all3 - desktop)

        "xd3" =
          ''
            xrandr --auto && \
            xrandr \
            --output DP-3 --pos    0x0   --rotate left \
            --output DP-1 --pos 1920x0   --rotate normal \
            --output DP-2 --pos 4480x0   --rotate normal --primary'';
    };
  };
}

### INFO
### Dimensions:
###
### |    MAC    |  SAMSUNG  |    AOC    |
### |-----------+-----------+-----------|
### | 2560x1440 | 1920x1080 | 1920x1080 |
###
###
### alignment, vertical:
### top:
###         0
### middle: (S to bottom of M)
###         M: 240
###         S: 600 (240+360)
### bottom:
###         M: 480
###         S: 360


### FUNDUS
# ### S to bottom of M to middle of A
#
# "xd" =
#   ''
#     xrandr --auto && \
#     xrandr \
#     --output DP-3 --pos    0x0   --rotate left             \
#     --output DP-2 --pos 1080x240 --rotate normal --primary \
#     --output DP-1 --off'';
