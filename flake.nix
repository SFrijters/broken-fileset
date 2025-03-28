{
  description = "Reproducer code for https://github.com/NixOS/nixpkgs/issues/393845";

  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  outputs =
    {
      nixpkgs,
      ...
    }:
    let
      system = "x86_64-linux";

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
