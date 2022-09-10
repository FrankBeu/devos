{ editor, keybindings }:
with keybindings;
''
#################################################################################################### ACTION
# set $mode_actionButton  actionButton  🅈y.zsh   🅄u.zsh   🄸i.zsh   🄾o.zsh   🄿p.zsh
set $mode_actionButton  actionButton  🅈y.zsh   🅄u.zsh   🄸i.zsh   🄾o.zsh   🄿p.zsh     🄷h.zsh   🄹j.zsh   🄺k.zsh   🄻l.zsh   Ⓢsemicolon.zsh     🄽n.zsh   🄼m.zsh   Ⓒcomma.zsh   Ⓟperiod.zsh   Ⓛslash.zsh
# set $mode_actionButton  actionButton  🅈 .zsh   🅄ACTION  🄸ACTION  🄾ACTION  🄿ACTION    🄷ACTION  🄹ACTION  🄺ACTION  🄻ACTION  ⓈACTION    🄽ACTION  🄼ACTION  ⒸACTION  ⓅACTION  ⓁACTION

mode "$mode_actionButton" {
    bindsym       $mod+y               mode "default", exec --no-startup-id        source  ~/.config/actionButton/y.zsh
    bindsym       $mod+u               mode "default", exec --no-startup-id        source  ~/.config/actionButton/u.zsh
    bindsym       $mod+i               mode "default", exec --no-startup-id        source  ~/.config/actionButton/i.zsh
    bindsym       $mod+o               mode "default", exec --no-startup-id        source  ~/.config/actionButton/o.zsh
    bindsym       $mod+p               mode "default", exec --no-startup-id        source  ~/.config/actionButton/p.zsh

    bindsym       $mod+shift+y         mode "default", exec --no-startup-id exec ${editor} ~/.config/actionButton/y.zsh
    bindsym       $mod+shift+u         mode "default", exec --no-startup-id exec ${editor} ~/.config/actionButton/u.zsh
    bindsym       $mod+shift+i         mode "default", exec --no-startup-id exec ${editor} ~/.config/actionButton/i.zsh
    bindsym       $mod+shift+o         mode "default", exec --no-startup-id exec ${editor} ~/.config/actionButton/o.zsh
    bindsym       $mod+shift+p         mode "default", exec --no-startup-id exec ${editor} ~/.config/actionButton/p.zsh


    bindsym       $mod+h               mode "default", exec --no-startup-id        source  ~/.config/actionButton/h.zsh
    bindsym       $mod+j               mode "default", exec --no-startup-id        source  ~/.config/actionButton/j.zsh
    bindsym       $mod+k               mode "default", exec --no-startup-id        source  ~/.config/actionButton/k.zsh
    bindsym       $mod+l               mode "default", exec --no-startup-id        source  ~/.config/actionButton/l.zsh
    bindsym       $mod+semicolon       mode "default", exec --no-startup-id        source  ~/.config/actionButton/semicolon.zsh

    bindsym       $mod+shift+h         mode "default", exec --no-startup-id exec ${editor} ~/.config/actionButton/h.zsh
    bindsym       $mod+shift+j         mode "default", exec --no-startup-id exec ${editor} ~/.config/actionButton/j.zsh
    bindsym       $mod+shift+k         mode "default", exec --no-startup-id exec ${editor} ~/.config/actionButton/k.zsh
    bindsym       $mod+shift+l         mode "default", exec --no-startup-id exec ${editor} ~/.config/actionButton/l.zsh
    bindsym       $mod+shift+semicolon mode "default", exec --no-startup-id exec ${editor} ~/.config/actionButton/semicolon.zsh


    bindsym       $mod+n               mode "default", exec --no-startup-id        source  ~/.config/actionButton/n.zsh
    bindsym       $mod+m               mode "default", exec --no-startup-id        source  ~/.config/actionButton/m.zsh
    bindsym       $mod+comma           mode "default", exec --no-startup-id        source  ~/.config/actionButton/comma.zsh
    bindsym       $mod+period          mode "default", exec --no-startup-id        source  ~/.config/actionButton/period.zsh
    bindsym       $mod+slash           mode "default", exec --no-startup-id        source  ~/.config/actionButton/slash.zsh

    bindsym       $mod+shift+n         mode "default", exec --no-startup-id exec ${editor} ~/.config/actionButton/n.zsh
    bindsym       $mod+shift+m         mode "default", exec --no-startup-id exec ${editor} ~/.config/actionButton/m.zsh
    bindsym       $mod+shift+comma     mode "default", exec --no-startup-id exec ${editor} ~/.config/actionButton/comma.zsh
    bindsym       $mod+shift+period    mode "default", exec --no-startup-id exec ${editor} ~/.config/actionButton/period.zsh
    bindsym       $mod+shift+slash     mode "default", exec --no-startup-id exec ${editor} ~/.config/actionButton/slash.zsh


    ### back2normalMode
    bindsym            Return     mode "default"
    bindsym            Escape     mode "default"
    bindsym       $mod+Return     mode "default"
    bindsym       $mod+Escape     mode "default"
}
bindsym $mod+${modeTrigger}       mode "$mode_actionButton"
bindsym $mod+shift+${modeTrigger} mode "$mode_actionButton" ''
# bindsym ${modeTrigger}  mode "$mode_actionButton" ''
# bindsym $mod+i  mode "$mode_actionButton" ''

### TODO doc



# Local Variables:
# mode: conf-unix
# eval:(hl-todo-mode 1)
# End:

# set $mode_actionButton  actionButton  🅈ACTION  🅄ACTION  🄸ACTION  🄾ACTION  🄿ACTION    🄷ACTION  🄹ACTION  🄺ACTION  🄻ACTION  ⓈACTION    🄽ACTION  🄼ACTION  ⒸACTION  ⓅACTION  ⓁACTION
# set $mode_actionButton  actionButton                                                    🄷ACTION  🄹ACTION  🄺ACTION  🄻ACTION  ⓈACTION    🄽ACTION  🄼ACTION  ⒸACTION  ⓅACTION  ⓁACTION
# 🅈🅄🄸🄾🄿🄷🄹🄺🄻Ⓢ🄽🄼ⒸⓅⓁ

# set $mode_action action (y) ACTION, (u) ACTION, (i) ACTION, (o) ACTION, (p) ACTION, (h) ACTION, (j) ACTION, (k) ACTION, (l) ACTION, (;) ACTION, (n) ACTION, (m) ACTION, (,) ACTION, (.) ACTION, (/) ACTION
# set $mode_action action 🆈ACTION  🆄ACTION  🅸ACTION  🅾ACTION  🅿ACTION  🅷ACTION  🅹ACTION  🅺ACTION  🅻ACTION  🅂ACTION  🅽ACTION  🅼ACTION  🄲ACTION  🄿ACTION  🄻ACTION
# set $mode_action action ✋🔴
# set $mode_action action: [f]irefox [t]hunderbird

# 🄰 🄱 🄲 🄳 🄴 🄵 🄶 🄷 🄸 🄹 🄺 🄻 🄼 🄽 🄾 🄿 🅀 🅁 🅂 🅃 🅄 🅅 🅆 🅇 🅈 🅉
# 🅐 🅑 🅒 🅓 🅔 🅕 🅖 🅗 🅘 🅙 🅚 🅛 🅜 🅝 🅞 🅟 🅠 🅡 🅢 🅣 🅤 🅥 🅦 🅧 🅨 🅩
# 🅰 🅱 🅲 🅳 🅴 🅵 🅶 🅷 🅸 🅹 🅺 🅻 🅼 🅽 🅾 🅿 🆀 🆁 🆂 🆃 🆄 🆅 🆆 🆇 🆈 🆉
# Ⓐ Ⓑ Ⓒ Ⓓ Ⓔ Ⓕ Ⓖ Ⓗ Ⓘ Ⓙ Ⓚ Ⓛ Ⓜ Ⓝ Ⓞ Ⓟ Ⓠ Ⓡ Ⓢ Ⓣ Ⓤ Ⓥ Ⓦ Ⓧ Ⓨ Ⓩ
# ⓐ ⓑ ⓒ ⓓ ⓔ ⓕ ⓖ ⓗ ⓘ ⓙ ⓚ ⓛ ⓜ ⓝ ⓞ ⓟ ⓠ ⓡ ⓢ ⓣ ⓤ ⓥ ⓦ ⓧ ⓨ ⓩ
#  ;⃝ ,⃝ .⃝
#  ;⃢ ,⃢ .⃢
#  ;⃣ ,⃣ .⃣
#  ;⃞ ,⃞ .⃞

# 🅀🅆🄴🅁🅃 🄰🅂🄳🄵🄶 🅇🅉🄲🅅🄱
# 🅈🅄🄸🄾🄿 🄷🄹🄺🄻Ⓢ 🄽🄼ⒸⓅⓁ

# 🅢 ### SHIFT
# 🅐 ### ALT
# 🅜 ### MOD
# 🅒 ### CTRL
# Ⓔ ### ESCAP
# Ⓡ ### RETURN
# Ⓣ ### TAB

# 🅀🅆🄴🅁🅃 🅈🅄🄸🄾🄿
# 🄰🅂🄳🄵🄶 🄷🄹🄺🄻Ⓢ
# 🅇🅉🄲🅅🄱 🄽🄼ⒸⓅⓁ

# 🆀🆆🅴🆁🆃 🆈🆄🅸🅾🅿
# 🅰🆂🅳🅵🅶 🅷🅹🅺🅻🅂
# 🆉🆇🅲🆅🅱 🅽🅼🄲🄿🄻

# 🅿🆂🅻🅲
# 🅟🅢🅛🅒
# ⓅⓈⓁⒸ
# ⓟⓢⓛⓒ
# 🄿🅂🄻🄲

# 🆀🆆🅴🆁🆃 🆈🆄🅸🅾🅿
# 🅰🆂🅳🅵🅶 🅷🅹🅺🅻
# 🆇🆉🅲🆅🅱 🅽🅼

# 🅠🅦🅔🅡🅣 🅨🅤🅘🅞🅟
# 🅐🅢🅓🅕🅖 🅗🅙🅚🅛
# 🅧🅩🅒🅥🅑 🅝🅜

# ⓆⓌⒺⓇⓉ ⓎⓊⒾⓄⓅ
# ⒶⓈⒹⒻⒼ ⒽⒿⓀⓁ
# ⓍⓏⒸⓋⒷ ⓃⓂ

# ⓠⓦⓔⓡⓣ ⓨⓤⓘⓞⓟ
# ⓐⓢⓓⓕⓖ ⓗⓙⓚⓛ
# ⓧⓩⓒⓥⓑ ⓝⓜ

# 🅀🅆🄴🅁🅃 🅈🅄🄸🄾🄿
# 🄰🅂🄳🄵🄶 🄷🄹🄺🄻
# 🅇🅉🄲🅅🄱 🄽🄼
