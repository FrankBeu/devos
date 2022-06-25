machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.fonts"):
    machine.wait_for_file('/etc/fonts/conf.d/00-nixos-cache.conf')
    font_cache = machine.succeed('cat /etc/fonts/conf.d/00-nixos-cache.conf')
    assert_contains(font_cache, 'dejavu-fonts'        )
    assert_contains(font_cache, 'fira-code'           )
    assert_contains(font_cache, 'fira-code-symbols'   )
    assert_contains(font_cache, 'font-awesome'        )
    assert_contains(font_cache, 'freefont-ttf'        )
    assert_contains(font_cache, 'gyre-fonts'          )
    assert_contains(font_cache, 'hack-font'           )
    assert_contains(font_cache, 'iosevka-bin'         )
    assert_contains(font_cache, 'liberation-fonts'    )
    assert_contains(font_cache, 'material-icons'      )
    assert_contains(font_cache, 'monoid'              )
    assert_contains(font_cache, 'noto-fonts'          )
    assert_contains(font_cache, 'noto-fonts-cjk-sans' )
    assert_contains(font_cache, 'noto-fonts-cjk-serif')
    assert_contains(font_cache, 'noto-fonts-emoji'    )
    assert_contains(font_cache, 'noto-fonts-extra'    )
    assert_contains(font_cache, 'powerline-fonts'     )
    assert_contains(font_cache, 'roboto'              )
    assert_contains(font_cache, 'roboto-mono'         )
    assert_contains(font_cache, 'roboto-slab'         )
    assert_contains(font_cache, 'unifont'             )




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.fonts::fontconfig"):
    machine.succeed('[[ -L /etc/fonts/fonts.conf ]]')
