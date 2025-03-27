{
  lib,
  python3,
}:

python3.pkgs.buildPythonPackage rec {
  pname = "mypkg";
  version = "0.1";
  pyproject = true;

  src = ./.;

  build-system = [ python3.pkgs.setuptools ];
}
