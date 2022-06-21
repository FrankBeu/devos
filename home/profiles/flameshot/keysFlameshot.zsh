#!/usr/bin/env zsh
###
### ---
### name:
###   keysFlameshot
### abstract:
###   "keysFlameshot: show all defined keybindings for flameshot"
### usage: |
###   keysFlameshot
###
### info: |
###    `flameshot --help`
###
###
### ---
###
bat \
    --style='grid' \
    << EOM
FLAMESHOT-KEYBINDINGS

                ┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐
                │y     ││u     ││i     ││o     ││p     ││      │ NO-MOD
                │      ││      ││      ││      ││      ││      │
                └──────┘└──────┘└──────┘└──────┘└──────┘└──────┘
                ┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐
                │h     ││j     ││k     ││l     ││;     ││      │
                │      ││left  ││up    ││down  ││right ││      │
                └──────┘└──────┘└──────┘└──────┘└──────┘└──────┘
                ┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐
                │n     ││m     ││,     ││.     ││/     ││      │
                │      ││      ││      ││      ││      ││      │
                └──────┘└──────┘└──────┘└──────┘└──────┘└──────┘

                ┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐
                │Y     ││U     ││I     ││O     ││P     ││      │ SHIFT
                │text  ││rec   ││inv   ││pix   ││pen   ││      │
                └──────┘└──────┘└──────┘└──────┘└──────┘└──────┘
                ┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐
                │H     ││J     ││K     ││L     ││:     ││      │
                │circ  ││sel   ││arr   ││line  ││DEAD  ││      │
                └──────┘└──────┘└──────┘└──────┘└──────┘└──────┘
                ┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐
                │N     ││M     ││<     ││>     ││?     ││      │
                │bub   ││mark  ││DEAD  ││DEAD  ││DEAD  ││      │
                └──────┘└──────┘└──────┘└──────┘└──────┘└──────┘

                ┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐
                │;     ││7     ││8     ││9     ││0     ││*     │ ALT
                │      ││undo  ││redo  ││      ││scr   ││      │
                └──────┘└──────┘└──────┘└──────┘└──────┘└──────┘
                ┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐
                │-     ││4     ││5     ││6     ││.     ││+     │
                │dec   ││x-    ││y-    ││y+    ││x+    ││      │
                └──────┘└──────┘└──────┘└──────┘└──────┘└──────┘
                ┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐
                │=     ││1     ││2     ││3     ││,     ││/     │
                │inc   ││move  ││app   ││pin   ││      ││      │
                └──────┘└──────┘└──────┘└──────┘└──────┘└──────┘

                ┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐
                │y     ││u     ││i     ││o     ││p     ││      │ CONTROL
                │      ││      ││      ││      ││      ││      │
                └──────┘└──────┘└──────┘└──────┘└──────┘└──────┘
                ┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐
                │h     ││j     ││k     ││l     ││;     ││      │
                │      ││      ││      ││      ││      ││      │
                └──────┘└──────┘└──────┘└──────┘└──────┘└──────┘
                ┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐
                │n     ││m     ││,     ││.     ││/     ││      │
                │      ││      ││      ││      ││      ││      │
                └──────┘└──────┘└──────┘└──────┘└──────┘└──────┘

        ┌──────────────┐
        │           TAB│ NO-MOD
        │panel         │
        └──────────────┘
┌──────┐┌──────┐┌──────┐
│      ││   RET││   SPC│
│      ││file  ││clip  │
└──────┘└──────┘└──────┘

        ┌──────────────┐
        │           TAB│ CONTROL
        │              │
        └──────────────┘
┌──────┐┌──────┐┌──────┐
│      ││   RET││   SPC│
│      ││txtRet││      │
└──────┘└──────┘└──────┘

EOM

# Local Variables:
# mode: zsh
# End: