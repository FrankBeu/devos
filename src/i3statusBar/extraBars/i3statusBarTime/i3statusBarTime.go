package main

import (
	"os/user"
	"path/filepath"
	"time"

	"barista.run"
	"barista.run/bar"
	"barista.run/base/click"
	"barista.run/colors"
	"barista.run/modules/clock"
	"barista.run/outputs"
	"barista.run/pango"
	"barista.run/pango/icons/fontawesome"
	"barista.run/pango/icons/material"
	"barista.run/pango/icons/mdi"

	colorful "github.com/lucasb-eyer/go-colorful"
	//// http-caching
	// "barista.run/testing/httpcache"
)

//// http-caching
// func init() {
// 	http.DefaultTransport = httpcache.Wrap(http.DefaultTransport)
// }

var spacer = pango.Text(" ").XXSmall()
var spacerDouble = pango.Text("  ").XXSmall()

func home(path string) string {
	usr, err := user.Current()
	if err != nil {
		panic(err)
	}
	return filepath.Join(usr.HomeDir, path)
}

var fontRepoLocation = ".local/share/fontRepos"

func main() {

	// if errors occur, i3statusBar will be displayed without icons
	_ = material.Load(home(fontRepoLocation + "/material-design-icons"))
	_ = mdi.Load(home(fontRepoLocation + "/MaterialDesign-Webfont"))
	_ = fontawesome.Load(home(fontRepoLocation + "/Font-Awesome"))

	colors.LoadBarConfig()
	bg := colors.Scheme("background")
	fg := colors.Scheme("statusline")
	if fg != nil && bg != nil {
		iconColor := fg.Colorful().BlendHcl(bg.Colorful(), 0.5).Clamped()
		colors.Set("dim-icon", iconColor)
		_, _, v := fg.Colorful().Hsv()
		if v < 0.3 {
			v = 0.3
		}
		colors.Set("bad", colorful.Hcl(40, 1.0, v).Clamped())
		colors.Set("degraded", colorful.Hcl(90, 1.0, v).Clamped())
		colors.Set("good", colorful.Hcl(120, 1.0, v).Clamped())
	}

	////// MODULES

	////// time
	localtime := clock.Local().
		Output(time.Second, func(now time.Time) bar.Output {
			return outputs.Pango(
				spacerDouble,
				pango.Icon("material-today").Color(colors.Scheme("dim-icon")),
				spacer,
				now.Format("Jan 2 Mon "),
				pango.Icon("material-access-time").Color(colors.Scheme("dim-icon")),
				spacer,
				pango.Textf("%s ", now.Format("15:04:05")).Rise(-1000),
				spacerDouble,
			).OnClick(click.RunLeft("gsimplecal"))
		})

	////// RUN
	panic(barista.Run(
		localtime,
	))
}
