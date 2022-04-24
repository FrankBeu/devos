{ colors, allColorsInfo }:
with colors;
''
${(allColorsInfo { inherit colors; })}


[Metadata]
Name=nixColor
Version=0.1
Author=fb
Description="a dynamic materialTheme"
ScaleWithDPI=True


[General]
TrayFont="Sans 11"

[InputPanel]
Font="Sans 13"
NormalColor=#${base05}
HighlightCandidateColor=#${base01}
HighlightColor=#${base01}
HighlightBackgroundColor=#${base0E}
Spacing=3
EnableBlur=False
### Use all horizontal space for highlight when it is vertical list
FullWidthHighlight=True



[InputPanel/TextMargin]
Left=5
Right=5
Top=5
Bottom=5

[InputPanel/ContentMargin]
### overal panel margin
Left=8
Right=8
Top=8
Bottom=8

[InputPanel/Background]
Color=#${base01}

### outer border
BorderColor=#${base0D}
BorderWidth=3

# Image=input_panel.png
# Image=assets/input_panel.png
# Overlay=
# Gravity="Bottom Left"
# OverlayOffsetX=0
# OverlayOffsetY=0
# HideOverlayIfOversize=False


[InputPanel/Background/Margin]
Left=2
Right=2
Top=2
Bottom=2

# [InputPanel/Background/OverlayClipMargin]
# Left=2
# Right=2
# Top=0
# Bottom=0

[InputPanel/Highlight]
Color=#$${base16}
# Image=highlight.png
# Image=assets/highlight.png
# BorderColor=#${base07}00
# BorderWidth=0
# Overlay=
# Gravity="Top Left"
# OverlayOffsetX=0
# OverlayOffsetY=0
# HideOverlayIfOversize=False
[InputPanel/Highlight/Margin]
Left=6
Right=6
Top=6
Bottom=6

# [InputPanel/Highlight/OverlayClipMargin]
# Left=0
# Right=0
# Top=0
# Bottom=0

# [InputPanel/Highlight/HighlightClickMargin]
# Left=0
# Right=0
# Top=0
# Bottom=0

[InputPanel/PrevPage]
# Image=former.png
Image=assets/former.png
[InputPanel/PrevPage/ClickMargin]
Left=5
Right=5
Top=4
Bottom=4

[InputPanel/NextPage]
# Image=next.png
Image=assets/next.png
[InputPanel/NextPage/ClickMargin]
Left=5
Right=5
Top=4
Bottom=4

[InputPanel/BlurMargin]
Left=2
Right=2
Top=2
Bottom=2



### RightClick on TrayIcon
[Menu]
NormalColor=#${base05}
HighlightCandidateColor=#${base01}
Spacing=0

[Menu/Background]
# Image=panel.png
# Image=assets/panel.png
Color=#${base00}
# BorderColor=#${base07}00
# BorderColor=#ff000000
BorderWidth=3
Overlay=
Gravity="Top Left"
OverlayOffsetX=0
OverlayOffsetY=0
HideOverlayIfOversize=False

[Menu/Background/Margin]
Left=2
Right=2
Top=2
Bottom=2

[Menu/Background/OverlayClipMargin]
Left=0
Right=0
Top=0
Bottom=0

[Menu/Highlight]
# Image=highlight.png
# Image=assets/highlight.png
Color=#${base0D}
# BorderColor=#${base07}00
BorderWidth=0
Overlay=
Gravity="Top Left"
OverlayOffsetX=0
OverlayOffsetY=0
HideOverlayIfOversize=False

[Menu/Highlight/Margin]
Left=5
Right=5
Top=5
Bottom=5

[Menu/Highlight/OverlayClipMargin]
Left=0
Right=0
Top=0
Bottom=0

[Menu/Separator]
Image=
Color=#${base04}
# BorderColor=#${base07}00
BorderWidth=0
Overlay=
Gravity="Top Left"
OverlayOffsetX=0
OverlayOffsetY=0
HideOverlayIfOversize=False

[Menu/Separator/Margin]
Left=0
Right=0
Top=0
Bottom=0

[Menu/Separator/OverlayClipMargin]
Left=0
Right=0
Top=0
Bottom=0

[Menu/CheckBox]
# Image=radio.png
# Image=assets/radio.png
# Color=#${base07}
# BorderColor=#${base07}00
BorderWidth=0
Overlay=
Gravity="Top Left"
OverlayOffsetX=0
OverlayOffsetY=0
HideOverlayIfOversize=False

[Menu/CheckBox/Margin]
Left=18
Right=8
Top=0
Bottom=0

[Menu/CheckBox/OverlayClipMargin]
Left=0
Right=0
Top=0
Bottom=0

[Menu/SubMenu]
# Image=arrow.png
Image=assets/arrow.png
# Color=#${base07}
# BorderColor=#${base07}00
# BorderWidth=0
# Overlay=
# Gravity="Top Left"
# OverlayOffsetX=10
# OverlayOffsetY=0
# HideOverlayIfOversize=False

[Menu/SubMenu/Margin]
Left=8
Right=8
Top=0
Bottom=0

[Menu/SubMenu/OverlayClipMargin]
Left=10
Right=10
Top=0
Bottom=0

[Menu/ContentMargin]
Left=2
Right=2
Top=2
Bottom=2

[Menu/TextMargin]
Left=5
Right=5
Top=5
Bottom=5
''
