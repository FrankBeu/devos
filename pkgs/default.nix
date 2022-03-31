final: prev: {
  ### keep sources first,
  sources = prev.callPackage (import ./_sources/generated.nix) { };

  ### then, call packages with `final.callPackage`
  i3statusBar = final.callPackage ./i3statusBar { };
}
