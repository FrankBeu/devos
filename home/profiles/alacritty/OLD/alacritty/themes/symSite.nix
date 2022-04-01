{ variables }:
with variables.themes.symSite;
{
content =
''
colorDefinition:
  black:      &black       "${black}"
  blackL10:   &blackL10    "${blackL10}"
  blackL20:   &blackL20    "${blackL20}"
  gray:       &gray        "${gray}"
  grayL10:    &grayL10     "${grayL10}"
  grayL20:    &grayL20     "${grayL20}"
  grayL33:    &grayL33     "${grayL33}"
  white:      &white       "${white}"
  blue:       &blue        "${blue}"
  red:        &red         "${red}"
  green:      &green       "${green}"
  yellow:     &yellow      "${yellow}"
  orange:     &orange      "${orange}"
  cyan:       &cyan        "${cyan}"
  magenta:    &magenta     "${magenta}"
  purple:     &purple      "${purple}"

  b-blue:     &b-blue      "${b-blue}"
  b-red:      &b-red       "${b-red}"
  b-green:    &b-green     "${b-green}"
  b-yellow:   &b-yellow    "${b-yellow}"
  b-orange:   &b-orange    "${b-orange}"
  b-cyan:     &b-cyan      "${b-cyan}"
  b-magenta:  &b-magenta   "${b-magenta}"
  b-purple:   &b-purple    "${b-purple}"

  d-blue:     &d-blue      "${d-blue}"
  d-red:      &d-red       "${d-red}"
  d-green:    &d-green     "${d-green}"
  d-yellow:   &d-yellow    "${d-yellow}"
  d-orange:   &d-orange    "${d-orange}"
  d-cyan:     &d-cyan      "${d-cyan}"
  d-magenta:  &d-magenta   "${d-magenta}"
  d-purple:   &d-purple    "${d-purple}"


colors:
  primary:
    background: *black
    foreground: *grayL33
    dim_foreground: *grayL20
    bright_foreground: *white

  cursor:
    text: CellBackground
    # cursor: CellForeground
    cursor: *orange

  vi_mode_cursor:
    text: CellBackground
    # cursor: CellForeground
    cursor: *magenta

  search:
    matches:
      foreground: CellBackground
      background: *yellow
    focused_match:
      foreground: CellBackground
      background: *orange
    bar:
      background: *blackL10
      foreground: *grayL33

  # hints:
  #   start:
  #     foreground: *black
  #     background: *yellow
  #   end:
  #     foreground: *yellow
  #     background: *black


  line_indicator:
    # foreground: None
    # background: None
    foreground: *grayL33
    background: *blackL10
    # foreground: None
    # background: None

  selection:
    text: CellForeground
    background: *blackL20

  normal:

    black:  *blackL10
    red:    *red
    green:  *green
    yellow: *yellow
    blue:   *blue
    agenta: *magenta
    cyan:   *cyan
    white:  *grayL33

  bright:
    black:   *blackL20
    red:     *b-red
    green:   *b-green
    yellow:  *b-yellow
    blue:    *b-blue
    magenta: *b-magenta
    cyan:    *b-cyan
    white:   *white

  dim:
    black:    *black
    red:      *d-red
    green:    *d-green
    yellow:   *d-yellow
    blue:     *d-blue
    magenta:  *d-magenta
    cyan:     *d-cyan
    white:    *grayL20


  TODO: workaround for powerline - fix powerline-theme
  indexed_colors:
    - { index: 20, color: *red }
'';
}
