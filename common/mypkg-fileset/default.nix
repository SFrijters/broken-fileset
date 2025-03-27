{
  lib,
  python3,
}:

python3.pkgs.buildPythonPackage rec {
  pname = "mypkg";
  version = "0.1";
  pyproject = true;

  src = lib.fileset.toSource {
    root = ./.;
    fileset = lib.fileset.unions [
      ./pyproject.toml
      ./setup.cfg
    ];
  };

  build-system = [ python3.pkgs.setuptools ];
}
