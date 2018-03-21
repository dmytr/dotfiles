{ system ? builtins.currentSystem }:

let 
  pkgs = import <nixpkgs> {};
  
  fetchurl = pkgs.fetchurl;
  callPackage = pkgs.callPackage;
in rec {
    nixpkgs = pkgs;

    maven_3_0_5 = callPackage ./pkgs/development/tools/build-managers/apache-maven/3.0.5.nix { maven = pkgs.maven; };  
}
