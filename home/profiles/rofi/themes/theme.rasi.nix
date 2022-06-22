# { theme, config }:
{ config }:
let inherit (config.lib.formats.rasi) mkLiteral;
in
{
  /**
  * ROFI Color theme
  * User: fb
  * Copyright: Dave Davenport
  * BASED on arthur.rasi
  */


  "*" = {
    ### /* black0 = mkLiteral "rgb(26,23,27)"    ; */
    ### /* black1 = mkLiteral "rgb(37,34,40)"    ; */
    ### /* black2 = mkLiteral "rgb(41,38,44)"    ; */
    ### /* black3 = mkLiteral "rgb(46,42,49)"    ; */
    ### /* gray0  = mkLiteral "rgb(188,186,190)" ; */
    ### /* gray1  = mkLiteral "rgba(196,203,212)"; */
    ### /* color0 = mkLiteral "rgb(175,58,3)"    ; */
    ### /* color1 = mkLiteral "rgb(216,19,127)"  ; */
    ### /* color2 = mkLiteral "rgba(01,172,255)" ; */

    black0 = mkLiteral           "#1A171B";
    black1 = mkLiteral           "#252228";
    black2 = mkLiteral           "#29262C";
    black3 = mkLiteral           "#2E2A31";
    gray0  = mkLiteral           "#BCBABE";
    gray1  = mkLiteral           "#C4CBD4 ";
    color0 = mkLiteral           "#AF3A03";
    color1 = mkLiteral           "#D8137F";
    color2 = mkLiteral           "#01ACFF";

    colorBorder = mkLiteral      "@color0";

    foreground       = mkLiteral "#ffeedd";
    backlight        = mkLiteral "#ccffeedd";
    background-color = mkLiteral "transparent";
    dark             = mkLiteral "#1c1c1c";

    ###/* BLACK */
    black       = mkLiteral      "#3d352a";
    lightblack  = mkLiteral      "#554444";
    tlightblack = mkLiteral      "#554444cc";

    ###/* RED */
    red      = mkLiteral         "#cd5c5c";
    lightred = mkLiteral         "#cc5533";

    ###/* GREEN */
    green      = mkLiteral       "#86af80";
    lightgreen = mkLiteral       "#88cc22";

    ###/* YELLOW */
    yellow      = mkLiteral      "#e8ae5b";
    lightyellow = mkLiteral      "#ffa75d";

    ###/* BLUE */
    blue      = mkLiteral        "#6495ed";
    lightblue = mkLiteral        "#87ceeb";

    ###/* MAGENTA */
    magenta      = mkLiteral     "#deb887";
    lightmagenta = mkLiteral     "#996600";

    ###/* CYAN */
    cyan      = mkLiteral        "#b0c4de";
    tcyan     = mkLiteral        "#ccb0c4de";
    lightcyan = mkLiteral        "#b0c4de";

    ###/* WHITE */
    white      = mkLiteral       "#bbaa99";
    lightwhite = mkLiteral       "#ddccbb";

    ###/* BOLD, ITALIC, UNDERLINE */
    highlight = mkLiteral   "underline bold #ffffff";

    transparent = mkLiteral "rgba(0,0,0,0)";

    ###/* font = mkLiteral "Source Code Pro 18"; */
    /* font = mkLiteral ''"Roboto 20"''; */
  };


  "window" = {
    location               = mkLiteral "center";
    anchor                 = mkLiteral "center";
    transparency           = mkLiteral ''"screenshot"'';
    padding                = mkLiteral "10px";
    border                 = mkLiteral "0px";
    border-radius          = mkLiteral "10px";
    color                  = mkLiteral "@magenta";
    ###/* background-color = mkLiteral "@transparent"; */
    background-color       = mkLiteral "@black2";
    spacing                = mkLiteral "0";
    children               = mkLiteral "[mainbox]";
    orientation            = mkLiteral "horizontal";
  };
  "mainbox" = {
    spacing  = mkLiteral "0";
    children = mkLiteral "[ inputbar, message, listview ]";
  };
  "message" = {
    ###/* border-color  = mkLiteral "@foreground"; */
    border-color     = mkLiteral "@colorBorder";
    background-color = mkLiteral "@tcyan";
    border           = mkLiteral "0px 2px 2px 2px";
    ###/* border-radius = mkLiteral  "10px"; */
    padding          = mkLiteral "5";
  };
  "message" = {
    ###/* font = mkLiteral "Source Code Pro 18"; */
    color = mkLiteral "@black";
  };
  "inputbar" = {
    ###/* color            = mkLiteral        "@lightgreen"; */
    ###/* background-color = mkLiteral    "@tlightblack"; */
    ###/* border-color     = mkLiteral    "@foreground"; */
    border-color     = mkLiteral    "@colorBorder";
    color            = mkLiteral        "@foreground";
    background-color = mkLiteral    "@black1";
    padding          = mkLiteral        "11px";
    border           = mkLiteral        "2px 2px 2px 2px";
    border-radius    = mkLiteral    "5px 5px 0px 0px";
    ###/* font             = mkLiteral "Source Code Pro 28"; */
  };
  ###/* ### TODO check */
  "entry,prompt,case-indicator" = {
    text-font  = mkLiteral "inherit";
    text-color = mkLiteral "inherit";
  };
  "prompt" = {
    margin = mkLiteral "0px 0.3em 0em 0em ";
  };
  "listview" = {
    ###/* border-color = mkLiteral "@foreground"; */
    border-color     = mkLiteral "@colorBorder";
    background-color = mkLiteral "#1c1c1ccc";
    padding          = mkLiteral "8px";
    border-radius    = mkLiteral "0px 0px 5px 5px";
    border           = mkLiteral "0px 2px 2px 2px";
    dynamic          = mkLiteral "false";
    lines            = mkLiteral "10";
  };
  "element" = {
    padding          = mkLiteral "3px";
    vertical-align   = mkLiteral "0.5";
    border           = mkLiteral "2px";
    border-radius    = mkLiteral "5px";
    ###/* background-color = mkLiteral "transparent"; */
    background-color = mkLiteral "@black1";
    color            = mkLiteral "@foreground";
    font             = mkLiteral "inherit";
  };

  "element-text" = {
    padding          = mkLiteral "4px 0px 0px 0px";
    background-color = mkLiteral "inherit";
    text-color       = mkLiteral "inherit";
  };

  "element selected.normal" = {
    ###/* background-color  = mkLiteral "@blue"; */
    ###/* background-color  = mkLiteral "@foreground"; */
    background-color = mkLiteral "@gray0";
    color            = mkLiteral "@black1";
  };

  "element normal active" = {
    foreground = mkLiteral "@lightblue";
  };

  "element normal urgent" = {
    foreground = mkLiteral "@lightred";
  };

  "element alternate normal" = {
  };

  "element alternate active" = {
    foreground = mkLiteral "@lightblue";
  };
  "element alternate urgent" = {
    foreground = mkLiteral "@lightred";
  };
  "element selected active" = {
    background-color = mkLiteral "@lightblue";
    foreground       = mkLiteral "@dark";
  };
  "element selected urgent" = {
    background-color = mkLiteral "@lightred";
    foreground       = mkLiteral "@dark";
  };

  "element normal normal" = {
  };

  "vertb" = {
    expand   = mkLiteral "false";
    children = mkLiteral "[ dummy0, mode-switcher, dummy1  ]";
  };
  "dummy0, dummy1" = {
    expand = mkLiteral "true";
  };
  "mode-switcher" = {
    expand      = mkLiteral "false";
    orientation = mkLiteral "horizontal";
    spacing     = mkLiteral "0px";
    border      = mkLiteral "0px 0px 0px 0px";
  };
  "button" = {
    ###/* font         = mkLiteral ""FontAwesome 22""; */
    padding          = mkLiteral "6px";
    border           = mkLiteral "2px 0px 2px 2px";
    border-radius    = mkLiteral "4px 0px 0px 4px";
    background-color = mkLiteral "@tlightblack";
    ###/* border-color = mkLiteral "@foreground"; */
    border-color     = mkLiteral "@colorBorder";
    color            = mkLiteral "@foreground";
    horizontal-align = mkLiteral "0.5";
  };
  "button selected normal" = {
    color            = mkLiteral "@dark";
    border           = mkLiteral "2px 0px 2px 2px";
    background-color = mkLiteral "@backlight";
    ###/* border-color     = mkLiteral "@foreground"; */
    border-color     = mkLiteral "@colorBorder";
  };
  "error-message" = {
    expand           = mkLiteral "true";
    background-color = mkLiteral "@lightred";
    border-color     = mkLiteral "@red";
    border           = mkLiteral "2px";
    padding          = mkLiteral "1em";
  };

  "#element-icon" = {
    size   = mkLiteral "40";                           /* 'element-text { padding' has to be adjusted*/
    margin = mkLiteral "0px 5px 0px 0px";
  };

}

# // Local Variables:
# // mode: css
# // End:
