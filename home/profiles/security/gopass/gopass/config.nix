{ username }:
let
  pathToStores = "/home/${username}/.local/share/gopass/stores";
in
''
  autoclip: false
  autoimport: true
  cliptimeout: 45
  exportkeys: true
  nopager: false
  notifications: true
  parsing: true
  path: ${pathToStores}/root
  safecontent: false
  mounts:
    k8s: ${pathToStores}/k8s
    thesym.site: ${pathToStores}/thesym.site
''
