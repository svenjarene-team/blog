{
  pkgs ? import (fetchTarball {
    # nixpkgs 24.05 has Hugo 0.125.x which is compatible with this theme
    url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/24.05.tar.gz";
    sha256 = "sha256:1lr1h35prqkd1mkmzriwlpvxcb34kmhc9dnr48gkm8hh089hifmx";
  }) {}
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    hugo
    nodejs_20
    go
  ];

  shellHook = ''
    echo "Hugo blog development environment"
    echo "Hugo: $(hugo version)"
    echo "Node: $(node --version)"
    echo "Go: $(go version)"
  '';
}
