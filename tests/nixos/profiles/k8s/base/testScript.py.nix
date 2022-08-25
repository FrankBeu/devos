{ ... }:
''
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.k8s.base"):
    sw_bin_content = machine.succeed('ls /run/current-system/sw/bin/')
    assert_contains_line(sw_bin_content, 'kubectl'  )
    assert_contains_line(sw_bin_content, 'kompose'  )
    assert_contains_line(sw_bin_content, 'kubecolor')
    assert_contains_line(sw_bin_content, 'kubens'   )
    assert_contains_line(sw_bin_content, 'kubectx'  )
    assert_contains_line(sw_bin_content, 'helm'     )
    assert_contains_line(sw_bin_content, 'starboard')


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.k8s.base::kubectl-plugins"):
    kubectl_plugin_output = machine.succeed('kubectl plugin list --name-only')
    assert_contains_line(kubectl_plugin_output, 'kubectl-cert_manager')
    assert_contains_line(kubectl_plugin_output, 'kubectl-doctor'      )
    assert_contains_line(kubectl_plugin_output, 'kubectl-example'     )
    assert_contains_line(kubectl_plugin_output, 'kubectl-neat'        )
    assert_contains_line(kubectl_plugin_output, 'kubectl-tree'        )

### TODO
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.k8s.base::docDotLocal"):
    # machine.wait_for_unit("documentation.service")
    # output = machine.wait_until_succeeds('curl localhost:41503/homemanager/k8s/')
    # assert_contains(output, "<title>k8s - Docs</title>")

''

# Local Variables:
# mode: python
# End:
