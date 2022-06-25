### depends on ../../../../nixos/profiles/shell/zsh/default.nix:1:30
{ config, nixosConfig, pkgs, variables, ... }:
let
  zshDotDir = ".config/zsh";
  inherit (config.home)                         username;
  inherit (nixosConfig.users.users.${username}) group;
in {

  ### set zshDotDir for imported modules
  _module.args.zshDotDir = zshDotDir;

  imports = [

    ### TODO TEST
    ./zsh/zshenv.nix  ### ENV  TODO distribute
    ./zsh/zshrc.nix   ### RC
    ./plugins         ### PLUGINS
  ];

  programs = {
    zsh = {
      defaultKeymap = "emacs";      ### needed if EDITOR is vim
      dotDir        = zshDotDir;
      enable        = true;
    };
  };
  home = {
    file."${zshDotDir}/zshrc.d".source = ./zsh/zshrc.d;

    ### TODO check after integration of all modules RENAME docDotLocal
    file.".docLocal/content/homemanager/shell.org".text = pkgs.lib.mkDefault(pkgs.lib.mkOrder 2 ''
      ${(import ./zsh.org { inherit username; })}
    '');

    packages = with pkgs; [
      nix-zsh-completions           ### https://github.com/spwhitt/nix-zsh-completions
      zsh-autosuggestions           ### https://github.com/zsh-users/zsh-autosuggestions
      zsh-completions               ### https://github.com/zsh-users/zsh-completions
      zsh-fast-syntax-highlighting  ### https://github.com/zdharma/fast-syntax-highlighting
      zsh-nix-shell                 ### https://github.com/chisui/zsh-nix-shell
    ];
  };

  ### ENVs and aliases not managed by nix and git
  systemd.user.tmpfiles.rules = [
    "D /home/${username}/${zshDotDir}/volatiles         0755 ${username} ${group} - -"
    "f /home/${username}/${zshDotDir}/volatiles/zshenv  0644 ${username} ${group} - -"
    "f /home/${username}/${zshDotDir}/volatiles/aliases 0644 ${username} ${group} - -"
  ];
}
