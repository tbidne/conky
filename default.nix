{ pkgs, stdenv, ... }:

let
  version = "v1.0.0";
in stdenv.mkDerivation {
  name = "conky";

  src = ./.;

  buildInputs = [ pkgs.conky ];

  installPhase = ''
    conky -c $src/conky_left.conf
    conky -c $src/conky_right.conf
  '';
}