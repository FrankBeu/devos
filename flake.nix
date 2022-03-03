{
  description = "A highly structured configuration database.";

  # nixConfig.extra-experimental-features = "nix-command flakes";
  # nixConfig.extra-substituters          = "https://nrdxp.cachix.org https://nix-community.cachix.org";
  # nixConfig.extra-trusted-public-keys   = "nrdxp.cachix.org-1:Fc5PSqY2Jm1TrWfm88l6cvGWwz3s93c6IOifQWnhNW4 = nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs =";

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
        latest = { };
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

      nixos = {
        hostDefaults = {
          system      = "x86_64-linux";
          channelName = "nixos";
          imports     = [ (digga.lib.importExportableModules ./modules) ];
          modules     = [
            { lib.our = self.lib; }
            digga.nixosModules.bootstrapIso
            digga.nixosModules.nixConfig
            home.nixosModules.home-manager
            agenix.nixosModules.age
            bud.nixosModules.bud
          ];
        };

        imports = [ (digga.lib.importHosts ./hosts) ];
        hosts   = {
          /* set host specific properties here */
          NixOS = {
            tests = [ digga.lib.allProfilesTest ];
          };
        };
        importables = rec {
          profiles  = digga.lib.rakeLeaves ./profiles // {
            users = digga.lib.rakeLeaves ./users;
          };
          suites = with profiles; rec {
            base = [ core users.nixos users.root ];
          };
        };
      };

      home = {
        imports = [ (digga.lib.importExportableModules ./users/modules) ];
        modules = [
          nix-colors.homeManagerModule
        ];
        importables = rec {
          profiles = digga.lib.rakeLeaves ./users/profiles;
          suites   = with profiles; rec {
            base = [ direnv git ];
          };
        };
        users = {
          nixos = { suites, ... }: { imports = suites.base; };
        }; # digga.lib.importers.rakeLeaves ./users/hm;
      };

      devshell = ./shell;

      homeConfigurations = digga.lib.mkHomeConfigurations self.nixosConfigurations;

      deploy.nodes = digga.lib.mkDeployNodes self.nixosConfigurations { };

      defaultTemplate           = self.templates.bud;
      templates.bud.path        = ./.;
      templates.bud.description = "bud template";

      ### TODO use checks instead of tests after native-flakes
      tests  = import ./tests { inherit self; };

    }
    //
    {
      budModules = { devos = import ./shell/bud; };
    }
    ;
}
