{
  description = "Main void flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    #marcpkgs.url = "https://github.com/marcs100/scribe-cli/releases/tag/0.1.0/source";
    #scribecli-pkg.url = "path:./packages/scribe-cli/";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
     system = "x86_64-linux";
     pkgs = nixpkgs.legacyPackages.${system};
     #scribe-cli = scribecli-pkg;
     host = "void";
     username = "marc";
  in
  {
      # Please replace my-nixos with your hostname
      nixosConfigurations = {
        "${host}" = nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit system;
              inherit username;
              inherit host;
              inherit inputs;
              #inherit scribe-cli;
            };


            modules = [
              # Import the previous configuration.nix we used,
              # so the old configuration file still takes effect
              #./configuration.nix
              ./hardware-configuration.nix
              ./system/boot.nix
              ./system/settings.nix
              ./system/sys-pkgs.nix
              ./system/gnome.nix
              ./system/sway.nix
              #./system/hyprland.nix
              #./system/plasma.nix
              ./system/services.nix
              ./system/users.nix
              home-manager.nixosModules.home-manager{
                  home-manager.extraSpecialArgs = {
                    inherit username;
                    inherit inputs;
                    inherit host;
                    #inherit scribe-cli;
                  };
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.backupFileExtension = "backup";
                home-manager.users.${username} = import ./home-manager/home.nix;
              }
            ];
        };
    };
  };
}
