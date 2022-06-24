{ variables }:
let currentColors = variables.currentTheme;
in
{

  colors = with currentColors; {
    fg          =  "-1";  ### Text
    bg          =  "-1";  ### Background
    preview-fg  =  "-1";  ### Preview window text
    preview-bg  =  "-1";  ### Preview window background
    hl          =  "10";  ### Highlighted substrings
    fgPlus      =  "-1";  ### Text (current line)

    bgPlus      =  "-1";  ### Background (current line)
    # gutter      =  "8";   ### Gutter on the left (defaults to bg+)
    gutter      =  "-1";   ### Gutter on the left (defaults to bg+)
    hlPlus      =  "3";   ### Highlighted substrings (current line)
    query       =  "2";   ### Query string
    disabled    =  "3";   ### Query string when search is disabled
    info        =  "12";  ### Info line (match counters)

    border      =  "8";   ### Border around the window (--border and --preview)
    prompt      =  "10";  ### Prompt
    pointer     =  "13";  ### Pointer to the current line
    marker      =  "13";  ### Multi-select marker
    spinner     =  "13";  ### Streaming input indicator
    header      =  "8";   ### Header
  };
}


     ### normal:
     ###   black:    0
     ###   red:      1
     ###   green:    2
     ###   yellow:   3
     ###   blue:     4
     ###   magenta:  5
     ###   cyan:     6
     ###   white:    7

     ### bright:
     ###   black:    8
     ###   red:      9
     ###   green:   10
     ###   yellow:  11
     ###   blue:    12
     ###   magenta: 13
     ###   cyan:    14
     ###   white:   15

     ###  -1         Default terminal foreground/background color
     ###  (or the original color of the text)
     ###  0 ~ 15     16 base colors
     ###  16 ~ 255   ANSI 256 colors
     ###  #rrggbb    24-bit colors
