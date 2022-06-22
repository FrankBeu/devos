{config, pkgs, ...}:
{
  home.packages = with pkgs; [
    # errcheck                                    ### error-linter https://github.com/kisielk/errcheck already included with golangci-lint
    go
    gofumpt                                     ### formatting
    goimports                                   ### godoc, ...
    ### TODO UPDATE
    # gotools
    ### TODO UPDATE-END
    gomodifytags                                ### https://github.com/fatih/gomodifytags
    golangci-lint
    gopls
    gotests                                     ### create tests automatically
    gotestsum                                   ### https://github.com/gotestyourself/gotestsum
    go-outline                                  ### https://github.com/ramya-rao-a/go-outline
    impl                                        ### https://github.com/josharian/impl
    reflex                                      ### https://github.com/cespare/reflex hot-reloading
    # gcc-unwrapped
    # binutils
  ];
  # environment.variables = {
    # GOROOT = [ "${pkgs.go}/share/go" ]; ### NOW
  # };
}
