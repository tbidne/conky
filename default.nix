{ pkgs, stdenv, ... }:

let
  version = "v1.0.0";
in stdenv.mkDerivation {
  name = "conky";

  src = ./.;

  buildInputs = [ pkgs.conky ];

  installPhase = ''
    cp $src/conky_left.conf ./
    cp $src/conky_right.conf ./
    cp $src/conky.lua ./

    conky -c ./conky_left.conf
    conky -c ./conky_right.conf
  '';
}