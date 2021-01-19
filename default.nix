{ pkgs, stdenv, ... }:

let
  version = "v1.0.0";
in stdenv.mkDerivation {
  name = "conky";

  src = ./.;

  buildInputs = [ pkgs.conky ];

  installPhase = ''
    cp $src/conky_left.conf $out
    cp $src/conky_right.conf $out
    cp $src/conky.lua $out

    conky -c $out/conky_left.conf
    conky -c $out/conky_right.conf
  '';
}