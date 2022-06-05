{ defaultBrowser, ... }:
let
  browser = if defaultBrowser == "chromium-browser" then "chromium" else defaultBrowser;
in
''#################################################################################################### DOC-DOT-LOCAL
bindsym       $mod+F1  exec --no-startup-id ${browser} "http://doc.local" ''
# bindsym $mod+F1 exec --no-startup-id chromium "http://doc.local" ''

### TODO xdg-open

# Local Variables:
# mode: conf-space
# eval:(rainbow-mode 1)
# eval:(hl-todo-mode 1)
# End:
