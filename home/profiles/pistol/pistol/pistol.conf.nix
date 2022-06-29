let
  ### TODO create theme based on colors
  # batTheme  = "ansi";
  batTheme    = "base16";
  batCmd      = ''bat --theme=${batTheme} --paging=never --color=always --style=changes,rule,snip --language'';
  extSuffixes = ''(TODO|BAK|_)''; ### enables pathHighlighting where the fileExtension is followed by suffixes
in
### {mime,path}Regex                program                 pistolFilename
''
application/json                    ${batCmd} json          %pistol-filename%
audio/*                             mediainfo               %pistol-filename%
# inode/directory                   ls -l --color           %pistol-filename%
inode/directory                     exa -l --color=always   %pistol-filename%
text/html                           w3m -T text/html -dump  %pistol-filename%
image/*                             mediainfo               %pistol-filename%
video/*                             mediainfo               %pistol-filename%

fpath .*.md${extSuffixes}?$           ${batCmd} md          %pistol-filename%
fpath .*.nix${extSuffixes}?$          ${batCmd} nix         %pistol-filename%
fpath .*.org${extSuffixes}?$          ${batCmd} org         %pistol-filename%
fpath .*.toml${extSuffixes}?$         ${batCmd} toml        %pistol-filename%
''


### TODO DOC
###         ranger: reload preview after confChange: =S-R=
###         themes: base16 ansi
