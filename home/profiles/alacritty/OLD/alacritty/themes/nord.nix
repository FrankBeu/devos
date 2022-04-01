### nord
### https://raw.githubusercontent.com/eendroroy/alacritty-theme/master/themes/nord.yaml
{ variables }:
with variables.themes.nord;
{
  content =
    ''colors:
        primary:
          background: "${nord0}"
          foreground: "${nord4}"

        normal:
          black:   "${nord3}"
          red:     "${nord11}"
          green:   "${nord14}"
          yellow:  "${nord13}"
          blue:    "${nord9}"
          magenta: "${nord15}"
          cyan:    "${nord7}"
          white:   "${nord6}"

        bright:
          black:   "${nord3}"
          red:     "${nord11}"
          green:   "${nord14}"
          yellow:  "${nord13}"
          blue:    "${nord9}"
          magenta: "${nord15}"
          cyan:    "${nord7}"
          white:   "${nord6}"

        ### TODO: workaround for powerline - fix powerline-theme
        indexed_colors:
          - { index: 20, color: "${nord8}" }
    '';
}
