{
  description = "A highly structured configuration database.";

  nixConfig.extra-experimental-features = "nix-command flakes";
  nixConfig.extra-substituters          = "https://nrdxp.cachix.org https://nix-community.cachix.org";
  nixConfig.extra-trusted-public-keys   = "nrdxp.cachix.org-1:Fc5PSqY2Jm1TrWfm88l6cvGWwz3s93c6IOifQWnhNW4= nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=";

  inputs = {
    nixos.url  = "github:nixos/nixpkgs/release-21.11";
    latest.url = "github:nixos/nixpkgs/nixos-unstable";

    agenix = {
      url                    = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixos";
    };

    bud = {
      url    = "github:divnix/bud";
      inputs = {
        nixpkgs.follows  = "nixos";
        devshell.follows = "digga/devshell";
      };
    };

    darwin = {
      url                    = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixos";
    };

    deploy = {
      # url                    = "github:input-output-hk/deploy-rs";
      url                    = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixos";
    };

    digga = {
      url    = "github:divnix/digga";
      inputs = {
        nixpkgs.follows      = "nixos";
        nixlib.follows       = "nixos";
        home-manager.follows = "home";
        deploy.follows       = "deploy";
      };
    };

    home = {
      url = "github:nix-community/home-manager/release-21.11";
      inputs.nixpkgs.follows = "nixos";
    };

    naersk = {
      url = "github:nmattia/naersk";
      inputs.nixpkgs.follows = "nixos";
    };

    nix-colors = {
      url = "github:misterio77/nix-colors";
      inputs = {
        nixpkgs.follows = "latest";
      };
    };

    nixos-hardware = {
      url = "github:nixos/nixos-hardware";
    };

    nvfetcher = {
      url                    = "github:berberman/nvfetcher";
      inputs.nixpkgs.follows = "nixos";
    };
  };

  outputs =
    { self
    , agenix
    , bud
    , deploy
    , digga
    , home
    , nix-colors
    , nixos
    , nixos-hardware
    , nur
    , nvfetcher
    , ...
    } @ inputs:
    digga.lib.mkFlake
    {
      inherit self inputs;

      channelsConfig = { allowUnfree = true; };

      channels = {
        nixos = {
          imports  = [ (digga.lib.importOverlays ./overlays) ];
          overlays = [
            nur.overlay
            agenix.overlay
            nvfetcher.overlay
            ./pkgs/default.nix
          ];
        };
        latest = {
          overlays = [
            nur.overlay
            agenix.overlay
            nvfetcher.overlay
            ./pkgs/default.nix
          ];
        };
      };

      lib = import ./lib { lib = digga.lib // nixos.lib; };

      sharedOverlays = [
        (final: prev: {
          __dontExport = true;
          lib          = prev.lib.extend (lfinal: lprev: {
            our = self.lib;
          });
        })
      ];

      nixos    = ./nixos;
      home     = ./home;
      devshell = ./shell;

      homeConfigurations = digga.lib.mkHomeConfigurations self.nixosConfigurations;

      deploy.nodes = digga.lib.mkDeployNodes self.nixosConfigurations { };

      defaultTemplate           = self.templates.bud;
      templates.bud.path        = ./.;
      templates.bud.description = "bud template";

      ### integrationTests (vm)
      tests  = import ./tests { inherit self; };

      ### TODO libUnitTests after native-flakes
      # checks = ./checks;

    }
    //
    {
      budModules = { devos = import ./shell/bud; };
    }
    ;
}
