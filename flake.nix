{
  description = "fileset bug";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      system = "x86_64-linux";
      name = "fileset-bug";

      pkgs = import nixpkgs {
        inherit system;
      };
    in
      {

        packages.${system} = {
          pkg-direct-src = pkgs.callPackage ./common/mypkg-src { };
          pkg-link-src = pkgs.callPackage ./link/mypkg-src { };

          pkg-direct-fileset = pkgs.callPackage ./common/mypkg-fileset { };
          pkg-link-fileset = pkgs.callPackage ./link/mypkg-fileset { };
        };
      };
}
