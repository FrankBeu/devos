### dracula
{ variables }:
with variables.themes.dracula;
{
  content = ''
    colors:
      primary:
        background: "${background}"
        foreground: "${foreground}"

      normal:
        black:   "${selection}"
        red:     "${red}"
        green:   "${green}"
        yellow:  "${orange}"
        blue:    "${comment}"
        magenta: "${pink}"
        cyan:    "${cyan}"
        white:   "${foreground}"

      bright:
        black:   "${selection}"
        red:     "${red}"
        green:   "${green}"
        yellow:  "${yellow}"
        blue:    "${purple}"
        magenta: "${pink}"
        cyan:    "${cyan}"
        white:   "${foreground}"

      ### TODO: workaround for powerline - fix powerline-theme
      indexed_colors:
         - { index: 20, color: "${comment}" }
  '';
}
