{ self, lib }:
let
  loadColorScheme =
    customSchemes: nixColorSchemes: currentColorSchemeName:
    let scheme = if lib.hasPrefix "custom-" currentColorSchemeName then customSchemes else nixColorSchemes;
    in (builtins.getAttr currentColorSchemeName scheme);

  allColorsInfo = { colors }:
    with colors;
    ''
      ### base00 #${base00} Default Background
      ### base01 #${base01} Lighter Background (Used for status bars)
      ### base02 #${base02} Selection Background
      ### base03 #${base03} Comments, Invisibles, Line Highlighting
      ### base04 #${base04} Dark Foreground (Used for status bars)
      ### base05 #${base05} Default Foreground, Caret, Delimiters, Operators
      ### base06 #${base06} Light Foreground (Not often used)
      ### base07 #${base07} Light Background (Not often used)
      ### base08 #${base08} Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
      ### base09 #${base09} Integers, Boolean, Constants, XML Attributes, Markup Link Url
      ### base0A #${base0A} Classes, Markup Bold, Search Text Background
      ### base0B #${base0B} Strings, Inherited Class, Markup Code, Diff Inserted
      ### base0C #${base0C} Support, Regular Expressions, Escape Characters, Markup Quotes
      ### base0D #${base0D} Functions, Methods, Attribute IDs, Headings
      ### base0E #${base0E} Keywords, Storage, Selector, Markup Italic, Diff Changed
      ### base0F #${base0F} Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
      ### base10 #${base10}
      ### base11 #${base11}
      ### base12 #${base12}
      ### base13 #${base13}
      ### base14 #${base14}
      ### base15 #${base15}
      ### base16 #${base16}
      ### base17 #${base17}'';

in
### TODO mapBase16ToBase24
### TODO unit-test
{ inherit allColorsInfo loadColorScheme; }
