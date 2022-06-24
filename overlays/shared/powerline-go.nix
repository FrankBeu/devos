final: prev:
{
  powerline-go = prev.powerline-go.overrideAttrs (old: {
    patches = (old.patches or []) ++ [
      ./powerline-go/0001-add-colorTheme-custom.patch
      ./powerline-go/0002-fix-shellVar-foreground-color.patch
    ];
  });
}
