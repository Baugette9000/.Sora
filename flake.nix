{

  description = "NixOS flake configuration.";

  inputs = { 
   nixpkgs.url = "nixpkgs/nixos-23.11";
   home-manager.url = "github:nix-community/home-manager/release-23.11";
   home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: 
    let 
     lib = nixpkgs.lib;
     system = "x86_64-linux";
     pkgs = nixpkgs.legacyPackages.${system};
    in { 
    nixosConfigurations = {
      hardware.nvidia.enable = true;
      security.pam.services.gtklock = {};
      nixos = lib.nixosSystem {
	      inherit system;
	        modules = [ ./modules/system/configuration.nix ];
       };
    };    

    homeConfigurations = { 
      hardware.nvidia.enable = true;
      security.pam.services.gtklock = {};
      cleo = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	        modules = [ ./modules/home-manager/home.nix ];
      };
    };
  };

}
