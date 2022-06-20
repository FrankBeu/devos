package main

import (
	"os/user"
	"path/filepath"
	"time"

	"barista.run"
	"barista.run/bar"
	"barista.run/base/click"
	"barista.run/base/watchers/netlink"
	"barista.run/colors"
	"barista.run/format"
	"barista.run/modules/clock"
	"barista.run/modules/cputemp"
	"barista.run/modules/diskspace"
	"barista.run/modules/meminfo"
	"barista.run/modules/netinfo"
	"barista.run/modules/netspeed"
	"barista.run/modules/sysinfo"
	"barista.run/modules/volume"
	"barista.run/modules/volume/alsa"
	"barista.run/outputs"
	"barista.run/pango"
	"barista.run/pango/icons/fontawesome"
	"barista.run/pango/icons/material"
	"barista.run/pango/icons/mdi"

	colorful "github.com/lucasb-eyer/go-colorful"
	"github.com/martinlindhe/unit"
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

	////// home
	diskSpaceHome := diskspace.New("/home").
		Output(func(i diskspace.Info) bar.Output {
			return outputs.Pango(
				pango.Icon("material-adjust").Color(colors.Scheme("dim-icon")),
				spacer,
				pango.Textf("%s avail", format.IBytesize(i.Available)).Rise(-1000),
				spacerDouble,
			)
		})

	////// link
	sub := netlink.Any()
	iface := sub.Get().Name
	sub.Unsubscribe()
	net := netspeed.New(iface).
		RefreshInterval(2 * time.Second).
		Output(func(s netspeed.Speeds) bar.Output {
			return outputs.Pango(
				pango.Icon("mdi-upload").Color(colors.Scheme("dim-icon")),
				spacer,
				pango.Textf("%7s", format.Byterate(s.Tx)),
				pango.Text(" ").Small(),
				pango.Icon("mdi-download").Color(colors.Scheme("dim-icon")),
				spacer,
				pango.Textf("%7s", format.Byterate(s.Rx)),
				spacerDouble,
			)
		})

	////// ip
	ip := netinfo.New().
		Output(func(s netinfo.State) bar.Output {
			if !s.Enabled() {
				return nil
			}
			for _, ip := range s.IPs {
				if ip.To4() == nil && ip.IsGlobalUnicast() {
					return outputs.Text(ip.String()).Color(colors.Scheme("good"))
				}
			}
			return outputs.Text("no IPv6").Color(colors.Scheme("bad"))
		})

	////// load
	loadAvg := sysinfo.New().Output(func(s sysinfo.Info) bar.Output {
		// out := outputs.Textf("%0.2f %0.2f", s.Loads[0], s.Loads[2])
		out := outputs.Pango(
			pango.Icon("mdi-clock-time-one-outline").Color(colors.Scheme("dim-icon")),
			spacerDouble,
			pango.Textf("%0.2f", s.Loads[0]),
			spacer,
			pango.Icon("mdi-clock-time-three-outline").Color(colors.Scheme("dim-icon")),
			spacer,
			pango.Textf("%0.2f", s.Loads[2]),
			spacerDouble,
		)
		// Load averages are unusually high for a few minutes after boot.
		// 1, 5, and 15 minute load averages
		if s.Uptime < 10*time.Minute {
			// so don't add colours until 10 minutes after system start.
			return out
		}
		switch {
		case s.Loads[0] > 128, s.Loads[2] > 64:
			out.Urgent(true)
		case s.Loads[0] > 64, s.Loads[2] > 32:
			out.Color(colors.Scheme("bad"))
		case s.Loads[0] > 32, s.Loads[2] > 16:
			out.Color(colors.Scheme("degraded"))
		}
		return out
	})

	////// memory
	freeMem := meminfo.New().Output(func(m meminfo.Info) bar.Output {
		out := outputs.Pango(
			spacerDouble,
			pango.Icon("material-memory").Color(colors.Scheme("dim-icon")),
			spacer,
			pango.Textf("%s", format.IBytesize(m.Available())).Rise(-1000),
			spacerDouble,
		)
		freeGigs := m.Available().Gigabytes()
		switch {
		case freeGigs < 0.5:
			out.Urgent(true)
		case freeGigs < 1:
			out.Color(colors.Scheme("bad"))
		case freeGigs < 2:
			out.Color(colors.Scheme("degraded"))
		case freeGigs > 12:
			out.Color(colors.Scheme("good"))
		}
		return out
	})

	////// root
	diskSpaceRoot := diskspace.New("/").
		Output(func(i diskspace.Info) bar.Output {
			return outputs.Pango(
				spacerDouble,
				pango.Icon("mdi-square-outline").Color(colors.Scheme("dim-icon")),
				spacer,
				pango.Textf("%s avail", format.IBytesize(i.Available)),
				spacer,
			)
		})

	////// temp
	temp := cputemp.New().
		RefreshInterval(2 * time.Second).
		Output(func(temp unit.Temperature) bar.Output {
			out := outputs.Pango(
				spacerDouble,
				pango.Icon("mdi-fan").Color(colors.Scheme("dim-icon")),
				spacer,
				pango.Textf("%2d℃", int(temp.Celsius())),
				spacerDouble,
			)
			switch {
			case temp.Celsius() > 90:
				out.Urgent(true)
			case temp.Celsius() > 70:
				out.Color(colors.Scheme("bad"))
			case temp.Celsius() > 60:
				out.Color(colors.Scheme("degraded"))
			}
			return out
		})

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

	////// vol
	vol := volume.New(alsa.DefaultMixer()).Output(func(v volume.Volume) bar.Output {
		if v.Mute {
			return outputs.
				Pango(
					spacerDouble,
					pango.Icon("fa-volume-mute"),
					spacer,
					"MUT",
					spacerDouble,
				).Color(colors.Scheme("degraded"))
		}
		iconName := "off"
		pct := v.Pct()
		if pct > 66 {
			iconName = "up"
		} else if pct > 33 {
			iconName = "down"
		}
		return outputs.Pango(
			spacerDouble,
			pango.Icon("fa-volume-"+iconName).Color(colors.Scheme("dim-icon")),
			spacer,
			pango.Textf("%2d%%", pct),
			spacerDouble,
		)
	})

	_ = ip

	////// RUN
	panic(barista.Run(
		net,
		// ip,
		vol,
		temp,
		freeMem,
		loadAvg,
		diskSpaceRoot,
		diskSpaceHome,
		localtime,
	))
}
